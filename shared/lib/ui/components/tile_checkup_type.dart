import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class TileCheckupType extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isSelected;
  const TileCheckupType(
      {super.key,
      required this.text,
      required this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? kCyanColor : kWhiteColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: kShadowColor.withOpacity(0.16),
              offset: const Offset(0, 5.0),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Center(
          child: Text(text,
              style: primaryTextStyle.copyWith(
                  fontSize: 14, fontWeight: semibold)),
        ),
      ),
    );
  }
}
