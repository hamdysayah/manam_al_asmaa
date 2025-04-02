import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/view/screens/estenbatNewNameSection/estenbat_name_from_name_search_screen.dart';
import 'package:manjam_asmaa/view/screens/estenbatNewNameSection/estenbat_name_from_namecheckbox_search_screen.dart';
import 'package:manjam_asmaa/view/screens/globalNamesSection/global_name_char_search_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_drawer.dart';
import 'estenbat_name_from_last_towchar_root_search_screen.dart';
import 'estenbat_name_from_root_search_screen.dart';
import 'estenbat_name_from_towchar_wight_search_screen.dart';

class TypeOfSearchEntenbatNameScreen extends StatelessWidget {
  const TypeOfSearchEntenbatNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          CustomText(text: 'اختر نوعية البحث'),
          customButton(
            text: 'أسماء مشتقة من جذر اسم معين',
            buttonWidth: 200.w,
            onClick: () {
              Get.to(EstenbatNameFromNameSearchScreen());
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'أسماء مشتقة على وزن اسم معين',
            buttonWidth: 200.w,
            onClick: () {
              Get.to(EstenbatNameFromNameCheckBoxSearchScreen());
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'أسماء مشتقة من جذر',
            buttonWidth: 200.w,
            onClick: () {
              Get.to(estenbat_name_from_root_search_screen());
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'أسماء مشتقة من جذر أوله حرفين',
            buttonWidth: 250.w,
            onClick: () {
              Get.to(estenbat_name_from_towchar_wight_search_screen());
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'أسماء مشتقة من جذر آخره حرفين',
            buttonWidth: 250.w,
            onClick: () {
              Get.to(estenbat_name_from_last_towchar_root_search_screen());

            },
          )
        ],
      ),
    );
  }
}
