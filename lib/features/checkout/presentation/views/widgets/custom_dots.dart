import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';

class CustomDots extends StatefulWidget {
  const CustomDots({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<CustomDots> createState() => _CustomDotsState();
}

class _CustomDotsState extends State<CustomDots> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      setState(() {
        currentIndex = widget.pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                widget.pageController.jumpToPage(index);
              },
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? AppColors.blackColor
                      : AppColors.greyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
