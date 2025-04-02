import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';

import '../widgets/custom_button.dart';

class ShareScreenEstenbat extends StatelessWidget {
  const ShareScreenEstenbat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('مشاركة الاسم كصورة'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(width: 1)),
              width: 300.w,
              height: 200.h,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.close)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomText(
                      text: ' الاسم:  ${Get.arguments[0]}',
                      fontWight: FontWeight.bold,
                      fontSize: 25.sp,
                    ),
                    CustomText(
                      text: ' الوزن:  ${Get.arguments[1]}',
                      fontWight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                    CustomText(
                      text: ' الجذر:  ${Get.arguments[2]}',
                      fontWight: FontWeight.bold,
                      fontSize: 20.sp,
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton(text: 'مشاركة كصورة', buttonWidth: 160.w, onClick: () {  }),
                customButton(text: 'حفظ كصورة', buttonWidth: 160.w, onClick: () {  })

              ],
            )
          ],
        ));
  }
}
