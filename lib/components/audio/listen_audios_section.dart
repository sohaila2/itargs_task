import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/app_cubit.dart';

class ListenAudiosSection extends StatelessWidget {
  const ListenAudiosSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit app = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Listen Audios',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  IconButton(
                    icon: state is AudioLoadingState
                        ? const CircularProgressIndicator()
                        : Icon(app.isPlaying ? Icons.stop : Icons.play_arrow),
                    onPressed: () {
                      if (app.isPlaying) {
                        app.stopAudio(context);
                      } else {
                        app.getAudioFromAPI(context);
                      }
                    },
                  ),
                  SizedBox(width: 8.0),
                  Text(app.isPlaying ? "Stop" : "Play this"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
