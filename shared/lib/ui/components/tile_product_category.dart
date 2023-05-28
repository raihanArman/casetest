import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class TileProductCategory extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isSelected;
  const TileProductCategory(
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
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : kWhiteColor,
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
          child: Text(
            text,
            style: isSelected
                ? whitextStyle.copyWith(fontSize: 12, fontWeight: semibold)
                : primaryTextStyle.copyWith(fontSize: 12, fontWeight: semibold),
          ),
        ),
      ),
    );
  }
}
