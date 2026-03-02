import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_colors.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/helper/helper_functions.dart';

class ReportThreadOption extends StatelessWidget {
  final String reason;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const ReportThreadOption({
    super.key,
    required this.reason,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.sm),
      child: InkWell(
        borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
        onTap: () => onChanged(reason),
        child: Container(
          padding: const EdgeInsets.all(Sizes.sm),
          decoration: BoxDecoration(
            color: dark ? CustomColors.dark : CustomColors.light,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: dark
                  ? Colors.grey.shade800
                  : const Color(0xFFF4E7E7),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reason,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Radio<String>(
                value: reason,
                groupValue: groupValue,
                activeColor: CustomColors.primary,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}