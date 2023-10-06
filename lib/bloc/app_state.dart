part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class SetDarkState extends AppState{}

class SetLightState extends AppState{}

class SetLocaleState extends AppState{}

class AudioLoadingState extends AppState {}

class GetAudioState extends AppState{}

class PlayAudioState extends AppState{}

class ListenToAudioState extends AppState{}

class StopAudioState extends AppState{}