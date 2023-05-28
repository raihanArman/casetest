import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class MenuOption extends StatelessWidget {
  final String text;
  final Function() onTap;
  const MenuOption({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: menuOptionTextStyle.copyWith(
                  fontSize: 12, fontWeight: semibold),
            ),
            SizedBox(
              width: 68,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kMenuOptionColor,
              size: 10,
            )
          ],
        ),
      ),
    );
  }
}
