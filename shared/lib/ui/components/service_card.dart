import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';
import 'package:shared/ui/components/elevated_button_navigation.dart';

class ServiceCard extends StatelessWidget {
  final bool isLeftImage;
  final String title;
  final String description;
  final String image;
  final String? textButton;
  final Function()? onClick;
  const ServiceCard(
      {super.key,
      this.isLeftImage = false,
      this.title = "",
      this.description = "",
      this.image = "service_1.png",
      this.onClick,
      this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      child: Stack(
        children: [
          Container(
              width: 335,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor.withOpacity(0.5),
                    offset: const Offset(0, 2.0),
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: isLeftImage
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 173,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semibold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          description,
                          style: secondTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 120,
                          child: ButtonNavigation(
                            text: textButton,
                            fontSize: 12,
                            onTap: onClick,
                            color: kPrimaryColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          Container(
            alignment: isLeftImage ? Alignment.topLeft : Alignment.topRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              "assets/images/" + image,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
