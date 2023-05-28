import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/ui/theme.dart';

import '../../util/enum.dart';

class TextFormFieldPassword extends StatelessWidget {
  final bool obsecureText;
  final TextEditingController? textEditingController;
  final int? maxLength;
  final String? hintText;
  final String? titleText;
  final TextInputType textInputType;
  final String? helperText;
  final int minLines;
  final int maxLines;
  final bool readOnly;
  final Function(String)? onChange;
  final AutovalidateMode? autovalidateMode;
  final GestureTapCallback? onTap;
  final GestureTapCallback onTapShowPassword;
  final bool withForgotPass;

  const TextFormFieldPassword(
      {Key? key,
      this.obsecureText = false,
      this.textEditingController,
      this.maxLength,
      this.titleText,
      this.hintText,
      this.helperText,
      this.minLines = 1,
      this.maxLines = 1,
      this.textInputType = TextInputType.text,
      this.readOnly = false,
      this.onChange,
      this.onTap,
      this.autovalidateMode,
      this.withForgotPass = false,
      required this.onTapShowPassword})
      : super(key: key);

  @override
  Widget build(Object context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleText ?? hintText ?? "",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            if (withForgotPass)
              Text(
                "Lupa Password anda ?",
                style: secondTextStyle.copyWith(
                    fontSize: 14, fontWeight: semibold),
              )
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: kShadowColor.withOpacity(0.16),
                offset: const Offset(0, 5.0),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: TextFormField(
            autovalidateMode: autovalidateMode,
            obscureText: obsecureText,
            keyboardType: textInputType,
            maxLength: maxLength ?? null,
            maxLines: maxLines,
            readOnly: readOnly,
            minLines: minLines,
            onChanged: onChange,
            controller: textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIconConstraints: BoxConstraints(),
                prefixIconConstraints: BoxConstraints(),
                suffixIcon: GestureDetector(
                  onTap: onTapShowPassword,
                  child: obsecureText
                      ? Icon(
                          Icons.visibility_off,
                          color: kGreyColor,
                        )
                      : Icon(
                          Icons.visibility,
                          color: kGreyColor,
                        ),
                ),
                hintText: hintText,
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 12, fontWeight: regular)),
          ),
        )
      ],
    );
  }
}
