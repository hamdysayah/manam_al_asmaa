import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/screens/global_name_object_result_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';

import '../../controller/app_contrller.dart';
import '../../core/database/database_queries.dart';
import '../widgets/custom_button.dart';
import 'global_name_char_result_screen.dart';

class GlobalNameObjectSearchScreen extends StatelessWidget {
  AppController appController = Get.find();
  String dropdownvalue = 'اختر الموضوع';
  var objectList = [
    'اختر الموضوع',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: 'اختر الموضوع'),
            Container(),
            SizedBox(
              height: 10,
            ),
            GetBuilder<AppController>(builder: (controller) {
              return FutureBuilder<List<String>>(
                  future: DatabaseQueries().getObjectsNames(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        objectList.clear();
                        for (var item in snapshot.data!) {
                          objectList.add(item);
                        }
                        return Expanded(
                          child: GridView.builder(
                            itemCount: objectList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 1,
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 7),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(GlobalObjectNameResultScreen(),
                                      arguments: objectList[index]);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(5),
                                    child: CustomText(
                                      text: objectList[index],
                                    )),
                              );
                            },
                          ),
                        );
                      } else {
                        return CustomText(text: 'لا يوجد نتائج');
                      }
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
