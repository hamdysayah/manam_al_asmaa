import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';

Widget customButton(
    {required String text,
    required double buttonWidth,
    required VoidCallback onClick}) {
  return SizedBox(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onClick,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(const Color(kPrimaryColor)),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ))),
        child: Text(text,
            style: TextStyle(fontSize: 20.sp, fontFamily: "ZainRegular")),
      ));
}
