import 'package:flutter/material.dart';

class IconCircleBackground extends StatelessWidget {
  final Color color;
  final Widget iconData;
  const IconCircleBackground(
      {super.key, required this.color, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: iconData,
    );
  }
}
