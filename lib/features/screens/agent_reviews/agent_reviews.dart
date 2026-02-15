import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans', // Add to pubspec if needed
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        primaryColor: const Color(0xFF5143EA),
      ),
      home: const AgentProfileScreen(),
    );
  }
}

class AgentProfileScreen extends StatelessWidget {
  const AgentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 20),
              const ProfileCard(),
              const SizedBox(height: 16),
              const StatsSection(),
              const SizedBox(height: 20),
              const ReviewsHeader(),
              const SizedBox(height: 12),
              const ReviewCard(
                name: "Chidinma Nwosu",
                time: "2 days ago",
                rating: 5,
                review:
                    "Babatunde was incredibly helpful throughout our search in Lekki. Highly recommended!",
              ),
              const SizedBox(height: 12),
              const ReviewCard(
                name: "Femi Adebayo",
                time: "1 week ago",
                rating: 4,
                review:
                    "Professional service and transparent communication. Helped me find a secure apartment within my budget.",
              ),
              const SizedBox(height: 12),
              const ReviewCard(
                name: "Emeka Obi",
                time: "2 weeks ago",
                rating: 5,
                review:
                    "Top-notch service! He knows exactly which properties are legitimate.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _circleIcon(Icons.arrow_back_ios_new),
        const Text(
          "Agent Profile",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _circleIcon(Icons.share),
      ],
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Icon(icon, size: 18),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuAZWKoKQ-nnEilMb403QYihfJ_wZRYAfJvluNju45NjLrMCpxB9SwH-as5ff_By4ttyoirV8TW-mCYOcMTp6-MUowcHaTF_8hKFsIqkwmnr2q0qm3NOoBl32FloPN8LHnDCFhR9NmUXfvQ705U8A7ScnH7dVY4cI9zdZAQZ4rWjCwKp6K4_4dQAlmgWu6orleDFW6Kf5rg1L9EaEjzB3FUKCfmTK7gUDPrDKRPeJKnBi2BOhwQCc1mJzug0SvUHs5lzs-knprKsnYs"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "Babatunde Olawale",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Senior Real Estate Consultant",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5143EA),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  label: const Text("Call Agent"),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF5143EA)),
                ),
                child: const Icon(Icons.chat_bubble_outline,
                    color: Color(0xFF5143EA)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: StatCard("Experience", "5 Years")),
        SizedBox(width: 8),
        Expanded(child: StatCard("Ratings", "4.8 ⭐")),
        SizedBox(width: 8),
        Expanded(child: StatCard("Properties", "150+")),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}

class ReviewsHeader extends StatelessWidget {
  const ReviewsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text("Reviews",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF5143EA).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("24",
                  style: TextStyle(
                      color: Color(0xFF5143EA),
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
        const Text("Write Review",
            style: TextStyle(
                color: Color(0xFF5143EA), fontWeight: FontWeight.w600))
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String time;
  final int rating;
  final String review;

  const ReviewCard({
    required this.name,
    required this.time,
    required this.rating,
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(time,
                  style: const TextStyle(fontSize: 10, color: Colors.grey))
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: List.generate(
              5,
              (index) => Icon(Icons.star,
                  size: 16,
                  color: index < rating
                      ? Colors.teal
                      : Colors.grey.shade300),
            ),
          ),
          const SizedBox(height: 8),
          Text(review,
              style: const TextStyle(color: Colors.black54, fontSize: 13)),
        ],
      ),
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home, color: Colors.grey),
          Icon(Icons.search, color: Colors.grey),
          CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xFF5143EA),
            child: Icon(Icons.add, color: Colors.white),
          ),
          Icon(Icons.person, color: Color(0xFF5143EA)),
          Icon(Icons.notifications, color: Colors.grey),
        ],
      ),
    );
  }
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 20,
        offset: const Offset(0, 4),
      )
    ],
  );
}
