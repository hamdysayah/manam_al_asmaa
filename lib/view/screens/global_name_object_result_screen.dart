import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manjam_asmaa/medel/namesModel.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../controller/app_contrller.dart';
import '../../core/database/database_queries.dart';
import '../widgets/name_details_dialog.dart';

class GlobalObjectNameResultScreen extends StatelessWidget {
  var theNamesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(),
              CustomText(
                text: 'الاسماء المقترحة حسب الموضوع',
                fontSize: 20.sp,
              ),
              GetBuilder<AppController>(builder: (controller) {
                return FutureBuilder<List<String>>(
                    future: DatabaseQueries().getNamesFromObject(Get.arguments),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isNotEmpty) {
                          theNamesList = snapshot.data!.toString().split('؛');

                          return Expanded(
                            child: GridView.builder(
                              itemCount: theNamesList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 1,
                                childAspectRatio: MediaQuery.of(context)
                                        .size
                                        .width /
                                    (MediaQuery.of(context).size.height / 7),
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(5),
                                    child: CustomText(
                                      text: theNamesList[index],
                                    ));
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
          NameDetailsDialog()
        ],
      )),
    );
  }
}
