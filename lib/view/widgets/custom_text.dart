
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
        required this.text,
        this.textColor,
        this.fontSize,
        this.fontFamily,
        this.fontWight,
        this.textAlign});

  final String text;
  final Color? textColor;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor??Colors.white,
          fontSize: fontSize ?? 16.sp,
          fontFamily: fontFamily??"ZainRegular",
          fontWeight: fontWight ?? FontWeight.normal),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
