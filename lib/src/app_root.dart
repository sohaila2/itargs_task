import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itargs_task/bloc/app_cubit.dart';
import 'package:itargs_task/views/home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp(
          theme: AppCubit.get(context).getTheme(),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          locale: AppCubit.get(context).currentLocale,
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        );
      },
    );
  }
}
