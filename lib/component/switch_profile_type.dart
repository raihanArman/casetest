import 'package:flutter/material.dart';
import 'package:shared/ui/components/tile_checkup_type.dart';
import 'package:shared/ui/theme.dart';

class SwitchProfileType extends StatelessWidget {
  final Function(int) onTap;
  final int indexSelected;
  const SwitchProfileType(
      {super.key, required this.onTap, required this.indexSelected});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: kShadowColor.withOpacity(0.16),
              offset: const Offset(0, 5.0),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Row(
          children: [
            TileCheckupType(
              text: "Profile Saya",
              onTap: () => onTap(0),
              isSelected: indexSelected == 0,
            ),
            TileCheckupType(
              text: "Pengaturan",
              onTap: () => onTap(1),
              isSelected: indexSelected == 1,
            ),
          ],
        ),
      ),
    );
  }
}
