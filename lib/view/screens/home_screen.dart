import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/screens/global_name_search_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          CustomText(
            text: 'منجم الاسماء',
            fontSize: 30.sp,
          ),
          SizedBox(
            height: 100.h,
          ),
          customButton(
            text: 'ابحث عن الاسماء الدارجة',
            buttonWidth: 200.w,
            onClick: () {
              Get.to(GlobalNameSearchScreen());
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'استنباط اسم جديد من جذر عربي معروف',
            buttonWidth: 200.w,
            onClick: () {
              showToast('test app');
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
            text: 'استنباط اسم جديد من جذر عربي غير مستعمل',
            buttonWidth: 250.w,
            onClick: () {
              showToast('test app');
            },
          ),
        ],
      ),
    );
  }
}
