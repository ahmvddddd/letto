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
  int _selectedIndex = 0;

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
                            SizedBox(height: 44), // Space for bottom nav
                          ],
                        );
                      },
                    ),
                  ),
                ),

                // Floating Bottom Navigation Bar
                AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  bottom: _isVisible ? 0 : -80,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: BottomNavigationBar(
                        backgroundColor: Colors.black,
                        selectedItemColor: Colors.white,
                        unselectedItemColor: Colors.white54,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: _selectedIndex,
                        onTap: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                          // Handle tab change here if needed
                        },
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.favorite),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.notifications),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: '',
                          ),
                        ],
                      ),
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
