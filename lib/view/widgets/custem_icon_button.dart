import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget CustemIconButton(
    {required String imagePath, required VoidCallback click}) {
  return InkWell(
    onTap: click,
    child: Image.asset(imagePath, width: 50.w, height: 50.h),
  );
}
