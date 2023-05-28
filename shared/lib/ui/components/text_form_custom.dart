import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/ui/theme.dart';

import '../../util/enum.dart';

class TextFormFieldCustom extends StatelessWidget {
  final bool obsecureText;
  final TextEditingController? textEditingController;
  final Widget? iconPrefix;
  final Widget? iconSuffix;
  final int? maxLength;
  final String? hintText;
  final TextInputType textInputType;
  final String? helperText;
  final int minLines;
  final int maxLines;
  final bool readOnly;
  final Function(String)? onChange;
  final GestureTapCallback? onTap;
  final ValidatorTypeForm? validatorType;
  final double marginLeftTitle;
  final Color? textColor;
  final String? titleText;
  final List<TextInputFormatter>? inputFormatters;

  const TextFormFieldCustom({
    Key? key,
    this.obsecureText = false,
    this.textEditingController,
    this.iconPrefix,
    this.iconSuffix,
    this.maxLength,
    this.hintText,
    this.helperText,
    this.minLines = 1,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.onChange,
    this.onTap,
    this.validatorType,
    this.marginLeftTitle = 10,
    this.titleText,
    this.textColor,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(Object context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText ?? hintText ?? "",
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
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
            maxLines: maxLines,
            controller: textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: iconSuffix,
                prefixIcon: iconPrefix,
                prefixIconConstraints: const BoxConstraints(),
                hintText: hintText,
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 12, fontWeight: regular)),
          ),
        )
      ],
    );
  }
}
