import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.indent, required this.endIndent});
  final double indent, endIndent;
  @override
  Widget build(BuildContext context) {
    return  Divider(
      thickness: 2,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
