import 'package:flutter/material.dart';

import '../../../models/story/story_model.dart';

class StoryViewer extends StatefulWidget {
  final StoryModel story;

  const StoryViewer({super.key, required this.story});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController progressController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    progressController.forward();

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() => isLoading = false);
      }
    });
  }

  @override
  void dispose() {
    progressController.dispose();
    super.dispose();
  }

  // Handle taps like Instagram
  void handleTapDown(TapDownDetails details, BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (details.globalPosition.dx < width * 0.33) {
      Navigator.pop(context); // left tap = close or prev
    } else if (details.globalPosition.dx > width * 0.66) {
      Navigator.pop(context); // right tap = next (only 1 story)
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 10) {
          Navigator.pop(context); // swipe down
        }
      },
      onTapDown: (d) => handleTapDown(d, context),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Story Image (after loading)
            AnimatedOpacity(
              opacity: isLoading ? 0 : 1,
              duration: const Duration(milliseconds: 600),
              child: Image.network(
                widget.story.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

            // Loading background (before image loads)
            if (isLoading)
              Container(
                color: widget.story.backgroundColor,
                child: Center(
                  child: Text(
                    widget.story.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            // Progress bar
            SafeArea(
              child: Container(
                height: 3,
                margin: const EdgeInsets.all(10),
                child: LinearProgressIndicator(
                  value: progressController.value,
                  backgroundColor: Colors.white12,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
