import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20),
      child: Divider(
        height: 1.0,
        color: Colors.black,
        thickness: 1.0,
      ),
    );
  }
}