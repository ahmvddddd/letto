import 'package:flutter/material.dart';
import '../../../models/story/story_model.dart';
import 'story_item.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: staticStories.length,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemBuilder: (context, index) {
          final story = staticStories[index];
          return StoryItem(story: story);
        },
      ),
    );
  }
}