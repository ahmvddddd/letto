import 'package:flutter/material.dart';

class StoryModel {
  final String userName;
  final Color backgroundColor;
  final String title;
  final String imageUrl; // NEW

  StoryModel({
    required this.userName,
    required this.backgroundColor,
    required this.title,
    required this.imageUrl,
  });
}

final List<StoryModel> staticStories = [
  StoryModel(
    userName: 'Traveler',
    backgroundColor: const Color(0xFF6C63FF),
    title: 'Paris Trip',
    imageUrl: 'https://picsum.photos/800/1200?random=1',
  ),
  StoryModel(
    userName: 'Foodie',
    backgroundColor: const Color(0xFFFF6B6C),
    title: 'Weekend Recipes',
    imageUrl: 'https://picsum.photos/800/1200?random=2',
  ),
  StoryModel(
    userName: 'Coder_X',
    backgroundColor: const Color(0xFF00BFA5),
    title: 'Flutter Tips',
    imageUrl: 'https://picsum.photos/800/1200?random=3',
  ),
  StoryModel(
    userName: 'Artist_Y',
    backgroundColor: const Color(0xFFFFD166),
    title: 'New Sketchbook',
    imageUrl: 'https://picsum.photos/800/1200?random=4',
  ),
  StoryModel(
    userName: 'Explorer',
    backgroundColor: const Color(0xFF1E90FF),
    title: 'Mountain Hike',
    imageUrl: 'https://picsum.photos/800/1200?random=5',
  ),
  StoryModel(
    userName: 'Gamer_Z',
    backgroundColor: const Color(0xFFB388FF),
    title: 'New Game Review',
    imageUrl: 'https://picsum.photos/800/1200?random=6',
  ),
];
