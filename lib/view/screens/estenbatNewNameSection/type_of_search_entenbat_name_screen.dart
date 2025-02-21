import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/view/screens/estenbatNewNameSection/estenbat_name_from_name_search_screen.dart';
import 'package:manjam_asmaa/view/screens/estenbatNewNameSection/estenbat_name_from_namecheckbox_search_screen.dart';
import 'package:manjam_asmaa/view/screens/globalNamesSection/global_name_char_search_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../widgets/custom_button.dart';

class TypeOfSearchEntenbatNameScreen extends StatelessWidget {
  const TypeOfSearchEntenbatNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('استنباط الاسماء من جذر ثلاث '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          CustomText(text: 'اختر نوعية البحث'),
          customButton(
            text: 'أسماء مقترحة مشتقة من جذر اسم معين',
            buttonWidth: 200.w,
            onClick: () {
              Get.to(EstenbatNameFromNameSearchScreen());
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'أسماء مقترحة على وزن اسم معين',
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
            onClick: () {},
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'أسماء مشتقة من جذر أوله حرفين',
            buttonWidth: 250.w,
            onClick: () {},
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'أسماء مشتقة من جذر آخره حرفين',
            buttonWidth: 250.w,
            onClick: () {},
          )
        ],
      ),
    );
  }
}
