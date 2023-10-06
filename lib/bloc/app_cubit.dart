import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String audioUrl = '';
  bool audioEnded = false;
  Locale _currentLocale = Locale('en');
  late String _sampleText;

  Locale get currentLocale => _currentLocale;
  String get sampleText => _sampleText;
  ThemeData themeData = ThemeData.light();

  ThemeData getTheme() => themeData;

  void setDarkTheme() {
    themeData = ThemeData.dark();
    emit(SetDarkState());
  }

  void setLightTheme() {
    themeData = ThemeData.light();
    emit(SetLightState());
  }

  void setLocale(Locale locale) {
    _currentLocale = locale;
    _loadStrings(locale.languageCode);
    emit(SetLocaleState());
  }

  void _loadStrings(String languageCode) {
    switch (languageCode) {
      case 'ar':
        _sampleText = Intl.message(
          'نص عينة',
          name: 'sampleText',
          desc: 'Sample text',
          locale: 'ar',
        );
        break;
      default:
        _sampleText = Intl.message(
          'Sample Text',
          name: 'sampleText',
          desc: 'Sample text',
          locale: 'en',
        );
    }
  }

  Future<void> getAudioFromAPI(BuildContext context) async {
    emit(AudioLoadingState());
    var url = 'https://api.quran.com/api/v4/chapter_recitations/1/1';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      audioUrl = responseData['audio_file']['audio_url'];
      playAudio(audioUrl, context);
    } else {
      print('Failed to fetch audio');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to fetch audio.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void playAudio(String audioUrl, BuildContext context) async {
    try {
      await audioPlayer.stop();
      await audioPlayer.play(UrlSource(audioUrl));
      isPlaying = true;
      emit(PlayAudioState());

      // Add a listener to detect when the audio has finished playing
      audioPlayer.onPlayerStateChanged.listen((state) {
        if (state == PlayerState.completed) {
          isPlaying = false;
          audioEnded = true;
          emit(ListenToAudioState());
        }
      });
    } catch (e) {
      print('Failed to play audio: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to play audio.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void stopAudio(BuildContext context) async {
    try {
      await audioPlayer.stop();
      isPlaying = false;
      emit(StopAudioState());
    } catch (e) {
      print('Failed to stop audio: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to stop audio.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
