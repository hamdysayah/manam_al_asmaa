import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manjam_asmaa/view/screens/global_name_char_search_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';

import '../widgets/custom_button.dart';

class TypeOfSearchGlobalScreen extends StatelessWidget {
  const TypeOfSearchGlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          CustomText(text: 'اختر نوعية البحث'),
          customButton(
            text: 'بحث من خلال الاحرف',
            buttonWidth: 200.w,
            onClick: () {
              Get.to(GlobalNameCharSearchScreen());
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'بحث من خلال الموضوع',
            buttonWidth: 200.w,
            onClick: () {

            },
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'بحث من خلال الجذر',
            buttonWidth: 250.w,
            onClick: () {

            },
          )
        ],
      ),
    );
  }
}
