import 'package:flutter/material.dart';
import 'package:shared/ui/components/elevated_button_navigation.dart';
import 'package:shared/ui/theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 34),
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                width: 172,
                child: Text(
                  "Ingin mendapat update dari kami ?",
                  style: whitextStyle.copyWith(fontSize: 16, fontWeight: bold),
                )),
          ),
          Container(
            child: ButtonNavigation(
              text: "Dapatkan\nnotifikasi",
              fontSize: 14,
              onTap: () {},
              color: kWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
