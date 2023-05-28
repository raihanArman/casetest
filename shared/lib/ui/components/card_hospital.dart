import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class CardHospital extends StatelessWidget {
  const CardHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: kShadowColor.withOpacity(0.16),
            offset: const Offset(0, 5.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PCR Swab Test (Drive Thru)",
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: semibold),
                  ),
                  Text(
                    "Hasil 1 Hari Kerja",
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: semibold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Rp. 1.400.000",
                    style: orangeTextStyle.copyWith(
                        fontSize: 14, fontWeight: semibold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/ic_hospital.png",
                        width: 14,
                        height: 14,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Hasil 1 Hari Kerja",
                        style: greyDarkTextStyle.copyWith(
                            fontSize: 14, fontWeight: semibold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/ic_location.png",
                        width: 14,
                        height: 14,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Dukuh Pakis, Surabaya",
                        style: greyTextStyle.copyWith(
                            fontSize: 12, fontWeight: medium),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Image.asset(
            "assets/images/hospital_sample.png",
            height: 149,
          )
        ],
      ),
    );
  }
}
