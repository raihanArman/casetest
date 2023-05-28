import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class ButtonCircle extends StatelessWidget {
  final Widget iconData;
  final Function()? onTap;
  const ButtonCircle({super.key, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: kShadowColor.withOpacity(0.16),
            offset: const Offset(0, 5.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: iconData,
    );
  }
}
