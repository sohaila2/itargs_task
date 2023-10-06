import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itargs_task/components/audio/listen_audios_section.dart';
import 'package:itargs_task/components/likes/top_likes_section.dart';
import 'package:itargs_task/components/divider.dart';
import 'package:itargs_task/components/tab_bar.dart';
import 'package:itargs_task/data/models/top_likes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: <Widget>[
            Text(
              "This is App",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            DividerWidget(),
            // SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Likes',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: getTopLikes(context).length,
              itemBuilder: (context, index) {
                return TopLikesSection(likes: getTopLikes(context)[index]);
              },
            ),
            DividerWidget(),
            ListenAudiosSection(),
          ],
        ),
      ),
      bottomNavigationBar: TabBarr(),
    );
  }
}
