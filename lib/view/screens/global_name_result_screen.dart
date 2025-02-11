import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:manjam_asmaa/view/namesModel.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../controller/app_contrller.dart';
import '../../core/database/database_queries.dart';

class GlobalNameResultScreen extends StatelessWidget {
  //String? searchName;

  // GlobalNameResultScreen() {
  //   searchName = Get.arguments[0];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            CustomText(
              text: 'الاسماء المقترحة',
              fontSize: 20.sp,
            ),
            GetBuilder<AppController>(builder: (controller) {
              return FutureBuilder<List<Namesmodel>>(
                  future: DatabaseQueries().getGlobalNamesFirstThreeOptions(
                      Get.arguments[1].toString(), Get.arguments[0]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Namesmodel> nameList = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomText(
                              text: '${nameList[index].name}',
                              fontSize: 25.sp,
                            );
                          },
                          itemCount: nameList.length,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return CustomText(text: snapshot.error.toString());
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(),
                          const CircularProgressIndicator(),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomText(text: '....جاري التحميل ')
                        ],
                      );
                    }
                  });
            }),
          ],
        ),
      ),
    );
  }
}
