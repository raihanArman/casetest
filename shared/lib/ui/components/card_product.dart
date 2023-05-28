import 'package:flutter/material.dart';
import 'package:shared/ui/components/tile_status.dart';
import 'package:shared/ui/theme.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
      margin: EdgeInsets.only(right: 15),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.star,
                color: kYellowColor,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "5",
                style:
                    greyTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
              ),
            ],
          ),
          Center(
            child: Image.asset(
              "assets/images/product_sample.png",
              width: 80,
              height: 80,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Suntik Steril",
            style:
                primaryTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rp. 10.000",
                style: orangeTextStyle.copyWith(
                    fontSize: 12, fontWeight: semibold),
              ),
              TileStatus()
            ],
          )
        ],
      ),
    );
  }
}
