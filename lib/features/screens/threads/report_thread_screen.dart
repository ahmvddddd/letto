import 'package:flutter/material.dart';

import '../../../utils/helper/helper_functions.dart';

class ReportThreadScreen extends StatefulWidget {
  const ReportThreadScreen({super.key});

  @override
  State<ReportThreadScreen> createState() => _ReportThreadScreenState();
}

class _ReportThreadScreenState extends State<ReportThreadScreen> {
  String? selectedReason;
  final TextEditingController detailsController = TextEditingController();

  final List<String> reasons = [
    "Spam",
    "Harassment",
    "Inappropriate Content",
    "Misinformation",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: Stack(
            children: [
              Column(
                children: [
                  // HEADER
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: dark
                          ? const Color(0xFF111121)
                          : const Color(0xFFF3F4F6),
                      border: Border(
                        bottom: BorderSide(
                          color: dark
                              ? Colors.grey.shade800
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Report Thread",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                      ],
                    ),
                  ),

                  // CONTENT
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Report this post",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Please select a reason for reporting this post to our moderation team.",
                            style: TextStyle(
                              fontSize: 16,
                              color: dark
                                  ? Colors.grey.shade400
                                  : Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // RADIO OPTIONS
                          ...reasons.map(
                            (reason) => _buildOption(reason, dark),
                          ),

                          const SizedBox(height: 24),

                          // ADDITIONAL DETAILS
                          const Text(
                            "Additional details (optional)",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: dark
                                  ? const Color(0xFF1E1E2D)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: dark
                                    ? Colors.grey.shade800
                                    : const Color(0xFFF4E7E7),
                              ),
                            ),
                            child: TextField(
                              controller: detailsController,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                hintText:
                                    "Tell us more about why you are reporting this...",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // FIXED FOOTER BUTTON
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: dark
                        ? const Color(0xFF111121)
                        : const Color(0xFFF3F4F6),
                    border: Border(
                      top: BorderSide(
                        color: dark
                            ? Colors.grey.shade800
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4343EA),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: selectedReason == null
                        ? null
                        : () {
                            // Submit logic
                            print("Reason: $selectedReason");
                            print("Details: ${detailsController.text}");
                          },
                    icon: const Icon(Icons.send),
                    label: const Text(
                      "Submit Report",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String reason, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            selectedReason = reason;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E2D) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Colors.grey.shade800 : const Color(0xFFF4E7E7),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reason,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Radio<String>(
                value: reason,
                groupValue: selectedReason,
                activeColor: const Color(0xFF4343EA),
                onChanged: (value) {
                  setState(() {
                    selectedReason = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
