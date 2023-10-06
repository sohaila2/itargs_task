import 'package:flutter/material.dart';
import 'package:itargs_task/views/home_view.dart';
import 'package:itargs_task/views/more_view.dart';

class TabBarr extends StatefulWidget {
  const TabBarr({super.key});

  @override
  State<TabBarr> createState() => _TabBarrState();
}

class _TabBarrState extends State<TabBarr> {
  bool isIconClicked = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.home_outlined),
                  color: isIconClicked ? Colors.purple : null,
                  onPressed: () {
                    setState(() {
                      isIconClicked = true;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  },
                ),
                Text('Home'),
              ],
            ),
            SizedBox(width: 50), // Add spacing between icons
            Column(
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.more_outlined),
                  color: isIconClicked ? Colors.purple : null,
                  onPressed: () {
                    setState(() {
                      isIconClicked = true;
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MoreView()));
                  },
                ),
                Text('More'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
