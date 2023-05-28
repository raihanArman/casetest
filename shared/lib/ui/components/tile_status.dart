import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class TileStatus extends StatelessWidget {
  const TileStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: kGreenColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "Ready",
        style: greenTextStyle.copyWith(fontSize: 10),
      ),
    );
  }
}
