import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class DrawerDashboard extends StatelessWidget {
  final Widget option;
  const DrawerDashboard({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: kPrimaryColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 86),
        child: Row(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
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
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 14, fontWeight: bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Praja",
                                          style: TextStyle(
                                              fontWeight: regular,
                                              color: kPrimaryColor))
                                    ]),
                              ),
                              Text(
                                "Membership BBLK",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 11,
                                  fontWeight: semibold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      option,
                      SizedBox(
                        height: 79,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ikuti kami di ",
                            style: primaryTextStyle.copyWith(
                                fontSize: 16, fontWeight: semibold),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Image.asset(
                            "assets/images/ic_facebook.png",
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Image.asset(
                            "assets/images/ic_twitter.png",
                            width: 12,
                            height: 12,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Image.asset(
                            "assets/images/ic_vector.png",
                            width: 12,
                            height: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FAQ",
                      style: greyLightTextStyle.copyWith(
                          fontSize: 14, fontWeight: bold),
                    ),
                    Text(
                      "Terms and Conditions",
                      style: greyLightTextStyle.copyWith(
                          fontSize: 14, fontWeight: bold),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
