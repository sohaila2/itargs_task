import 'package:flutter/material.dart';
import 'package:itargs_task/components/divider.dart';
import '../bloc/app_cubit.dart';
import '../components/tab_bar.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit app = AppCubit.get(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Text(
              "More",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DividerWidget(),
            Text(
              "Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode"),
                Switch(
                  value: app.getTheme().brightness == Brightness.dark,
                  onChanged: (value) {
                    if (value) {
                      app.setDarkTheme();
                    } else {
                      app.setLightTheme();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Arabic Language"),
                Switch(
                  value: app.currentLocale.languageCode == 'ar',
                  onChanged: (newValue) {
                    final languageProvider = app;
                    final newLocale = newValue ? Locale('ar') : Locale('en');
                    languageProvider.setLocale(newLocale);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: TabBarr(),
    );
  }
}
