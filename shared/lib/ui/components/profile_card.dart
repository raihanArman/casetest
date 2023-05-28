import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: 37,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/profile_sample.png",
                width: 36,
                height: 36,
              ),
              SizedBox(
                width: 17,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Angga ",
                        style: whitextStyle.copyWith(
                            fontSize: 18, fontWeight: bold),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Praja",
                              style: TextStyle(
                                  fontWeight: regular, color: kWhiteColor))
                        ]),
                  ),
                  Text(
                    "Membership BBLK",
                    style: whitextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semibold,
                        color: kWhiteColor.withOpacity(0.5)),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 48,
          ),
          Text(
            "Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi",
            style: whitextStyle.copyWith(fontSize: 12, fontWeight: regular),
          ),
          SizedBox(
            height: 11,
          )
        ],
      ),
    );
  }
}
