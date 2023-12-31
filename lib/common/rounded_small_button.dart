import 'package:flutter/material.dart';
import '../theme/theme.dart';


class RoundedSmallButton extends StatelessWidget {
  const RoundedSmallButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.backgroundColor = Pallete.blueColor,
    this.textColor = Pallete.whiteColor,
  }) : super(key: key);
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
      ),
    );
  }
}