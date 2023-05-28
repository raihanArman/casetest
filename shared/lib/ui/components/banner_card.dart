import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';
import 'package:shared/ui/components/elevated_button_custom.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor.withOpacity(0.5),
                    offset: const Offset(0, 2.0),
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage("assets/images/bg_card.png"),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  Image.asset(
                    "assets/images/bg_card.png",
                    fit: BoxFit.fill,
                    height: 141,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Solusi, ",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 18, fontWeight: semibold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Kesehatan Anda",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor))
                                ]),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Update informasi seputar kesehatan semua bisa disini !",
                            style: secondTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: 120,
                            child: ElevatedButtonCustom(
                              text: "Selengkapnya",
                              fontSize: 12,
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              "assets/images/banner_sample.png",
              width: 130,
            ),
          ),
        ],
      ),
    );
  }
}
