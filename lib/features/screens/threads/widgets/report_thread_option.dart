import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

class ReportThreadOption extends StatefulWidget {
  final String reason;
  const ReportThreadOption({
    super.key,
    required this.reason,
  });

  @override
  State<ReportThreadOption> createState() => _ReportThreadOptionState();
}

class _ReportThreadOptionState extends State<ReportThreadOption> {
  String selectedReason = '';
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
        onTap: () {
          setState(() {
            selectedReason = widget.reason;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: dark ? CustomColors.dark : CustomColors.light,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: dark ? Colors.grey.shade800 : const Color(0xFFF4E7E7),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.reason, style: Theme.of(context).textTheme.titleMedium),
              Radio<String>(
                value: widget.reason,
                groupValue: selectedReason,
                activeColor: CustomColors.primary,
                onChanged: (value) {
                  setState(() {
                    selectedReason = value!;
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
