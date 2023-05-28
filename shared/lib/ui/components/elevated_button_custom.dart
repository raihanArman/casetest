import 'package:flutter/material.dart';
import 'package:shared/ui/theme.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String? text;
  final Color? color;
  final bool isLoading;
  final Widget? iconData;
  final double? fontSize;
  final Function()? onTap;

  const ElevatedButtonCustom(
      {this.text,
      this.color,
      this.isLoading = false,
      this.iconData,
      this.onTap,
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? kBlueColor,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onTap,
        child: Container(
          child: !isLoading
              ? Row(
                  children: [
                    Expanded(
                        child: Text(
                      text ?? "",
                      style: color != null
                          ? primaryTextStyle.copyWith(
                              fontSize: fontSize, fontWeight: semibold)
                          : whitextStyle.copyWith(
                              fontSize: fontSize, fontWeight: semibold),
                      textAlign: TextAlign.center,
                    )),
                    iconData ?? const SizedBox()
                  ],
                )
              : Container(
                  height: 15,
                  width: 15,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kWhiteColor,
                      strokeWidth: 2,
                    ),
                  ),
                ),
        ));
  }
}
