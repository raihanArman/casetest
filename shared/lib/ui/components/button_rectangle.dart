import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class ButtonRectangle extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color? color;
  final TextStyle? textStyle;
  const ButtonRectangle(
      {super.key, required this.text, this.onTap, this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color ?? kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: kShadowColor.withOpacity(0.16),
            offset: const Offset(0, 5.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Text(
        text,
        style: textStyle ?? whitextStyle.copyWith(fontSize: 11),
      ),
    );
  }
}
