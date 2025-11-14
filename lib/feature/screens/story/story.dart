import 'package:flutter/material.dart';

// --- 1. Data Model ---

class Story {
  final String userName;
  final Color backgroundColor;
  final String title;
  
  Story({required this.userName, required this.backgroundColor, required this.title});
}

final List<Story> staticStories = [
  Story(userName: 'Traveler', backgroundColor: const Color(0xFF6C63FF), title: 'Paris Trip'),
  Story(userName: 'Foodie', backgroundColor: const Color(0xFFFF6B6C), title: 'Weekend Recipes'),
  Story(userName: 'Coder_X', backgroundColor: const Color(0xFF00BFA5), title: 'Flutter Tips'),
  Story(userName: 'Artist_Y', backgroundColor: const Color(0xFFFFD166), title: 'New Sketchbook'),
  Story(userName: 'Explorer', backgroundColor: const Color(0xFF1E90FF), title: 'Mountain Hike'),
  Story(userName: 'Gamer_Z', backgroundColor: const Color(0xFFB388FF), title: 'New Game Review'),
];

class StoryApp extends StatelessWidget {
  const StoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rectangular Story View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const StoryScreen(),
    );
  }
}

// --- 4. Screen Implementation ---

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // The main story view section
            const StoryView(),
            
            // Placeholder content to show the stories are part of a larger scrollable page
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Recent Posts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            
            // Dummy list content
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // To allow main scroll view to handle scrolling
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Post Title'),
                    subtitle: Text('This is placeholder content for the feed.'),
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// --- 5. Horizontal Story View Widget ---

class StoryView extends StatelessWidget {
  const StoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Height for the story row
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


// --- 6. Single Rectangular Story Item Widget ---

class StoryItem extends StatelessWidget {
  final Story story;
  
  const StoryItem({required this.story, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
      child: Column(
        children: [
          // The main rectangular story container
          Container(
            width: 100, // Fixed width for the rectangular story
            height: 140, // Fixed height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Apply 20px corner radius
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Clip content inside the container
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background/Image placeholder (using color for simplicity)
                  Container(
                    color: story.backgroundColor,
                    child: Center(
                      child: Text(
                        story.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  
                  // Optional: A subtle gradient overlay for better text contrast
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black.withValues(alpha: 0.1), Colors.black.withValues(alpha: 0.3)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 4),
          
          // User name below the story
          Text(
            story.userName,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}