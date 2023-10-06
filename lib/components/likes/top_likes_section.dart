import 'package:flutter/material.dart';
import 'package:itargs_task/data/models/top_likes.dart';

class TopLikesSection extends StatefulWidget {
  final TopLikes likes;

  TopLikesSection({required this.likes});

  @override
  State<TopLikesSection> createState() => _TopLikesSectionState();
}

class _TopLikesSectionState extends State<TopLikesSection> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(widget.likes.text),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: isLiked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
