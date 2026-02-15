import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/app_stayles.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      leading: Center(
        child: IconButton(
            onPressed: () {
              title == 'My Cart' ? null : Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/icons/arrow.svg")),
      ),
      title: Text(
        title,
        style: AppStyles.styleMedium25,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(56.0); // Default AppBar height
}
