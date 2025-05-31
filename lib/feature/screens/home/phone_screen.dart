import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  PhoneScreenState createState() => PhoneScreenState();
}

class PhoneScreenState extends State<PhoneScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _previousOffset = 0.0;
  bool _isVisible = true;

  bool _handleScroll(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final double currentOffset = notification.metrics.pixels;
      final double delta = currentOffset - _previousOffset;

      setState(() {
        if (delta > 0 && _isVisible) {
          _isVisible = false;
        } else if (delta < 0 && !_isVisible) {
          _isVisible = true;
        }
      });

      _previousOffset = currentOffset;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background
        Container(color: Colors.black),
        // Phone Frame
        Center(
          child: Container(
            width: 375, // Approximate iPhone width
            height: 812, // Approximate iPhone height
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Grid
                NotificationListener<ScrollNotification>(
                  onNotification: _handleScroll,
                  child: SingleChildScrollView(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Column(
                          children: [
                            SizedBox(height: 44), // Space for status bar
                            GridView.count(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              crossAxisCount: 2,
                              children: List.generate(20, (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[800],
                                  ),
                                  margin: EdgeInsets.all(6),
                                  height: 150,
                                  width: 150,
                                );
                              }),
                            ),
                            SizedBox(height: 44), // Space for status bar
                          ],
                        );
                      },
                    ),
                  ),
                ),

                AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  bottom: _isVisible ? 0 : -80,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.all(12),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.home, color: Colors.white, size: 24),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withValues(alpha: 0.5),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 24,
                        ),
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),

                // Status Bar
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 44,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            '17:46',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.signal_cellular_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                            Icon(Icons.wifi, color: Colors.white, size: 20),
                            Icon(
                              Icons.battery_full,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}