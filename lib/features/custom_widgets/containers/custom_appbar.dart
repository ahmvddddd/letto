import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.centerTitle = false
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return SafeArea(
      // ✅ Ensure it respects the status bar
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.sm),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent, // Optional: customize
          leading:
              showBackArrow
                  ? IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Iconsax.arrow_left,
                      color: dark ? CustomColors.white : CustomColors.dark,
                    ),
                  )
                  : leadingIcon != null
                  ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(
                      leadingIcon,
                      color: dark ? CustomColors.white : CustomColors.dark,
                    ),
                  )
                  : null,
          title: title,
          centerTitle: centerTitle,
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
