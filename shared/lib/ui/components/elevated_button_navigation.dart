import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class ButtonNavigation extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final Function()? onTap;

  const ButtonNavigation(
      {this.text, this.color, this.onTap, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Text(
              text ?? "",
              style: primaryTextStyle.copyWith(
                  fontSize: 14, fontWeight: semibold, color: color),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.arrow_forward,
              color: color,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
