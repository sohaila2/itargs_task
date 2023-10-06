import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itargs_task/bloc/app_cubit.dart';
import 'package:itargs_task/src/app_root.dart';


void main() {
  runApp(BlocProvider(
    create: (context) => AppCubit(),
    child: AppRoot(
    ),
  ));
}

