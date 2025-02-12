import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';

Widget NameDetailsDialog() {
  return Visibility(
      visible: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Colors.red),
            width: 100.w,
            height: 100.h,
            child: CustomText(text: 'شسيشسي'),
          ),
        ],
      ));
}
