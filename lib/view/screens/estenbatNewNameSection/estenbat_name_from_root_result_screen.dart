import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manjam_asmaa/medel/namesModel.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';

class EstenbatNameFromRootResultScreen extends StatelessWidget {
  AppController appController = Get.find();
  String selectedName = '';

  @override
  Widget build(BuildContext context) {
    appController.isVisibleNameDetailsDialog = false;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_screen_search.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(),
                  CustomText(
                    text:
                        'الاسماء المشتقة من الجذر (${Get.arguments[0] + Get.arguments[1] + Get.arguments[2]})',
                    fontSize: 20.sp,
                  ),
                  GetBuilder<AppController>(builder: (controller) {
                    return FutureBuilder<List<String>>(
                        future: DatabaseQueries().getNamesFromRootEstenbat(
                            Get.arguments[0],
                            Get.arguments[1],
                            Get.arguments[2]),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              List<String> theNamesList = snapshot.data!;
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
                                        (MediaQuery.of(context).size.height /
                                            7),
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        selectedName = theNamesList[index]
                                            .toString()
                                            .replaceAll('[', '')
                                            .replaceAll(']', '');

                                        appController
                                            .isVisibleNameDetailsDialog = true;
                                        appController.update();
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.bottomRight,
                                                end: Alignment.topLeft,
                                                colors: [
                                                  Color(0xFF020202),
                                                  Color(0xFF292A2D),
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.all(5),

                                          //لما يختار الاسم
                                          child: CustomText(
                                            text: theNamesList[index]
                                                .toString()
                                                .replaceAll('[', '')
                                                .replaceAll(']', ''),
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

              //عرض تفاصيل الاسم
              GetBuilder<AppController>(builder: (controller) {
                return Visibility(
                    visible: controller.isVisibleNameDetailsDialog,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(width: 1)),
                          width: 300.w,
                          //  height: 300.h,
                          child: FutureBuilder<List<String>>(
                              future: DatabaseQueries()
                                  .getResultFormEstenbat(selectedName),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                              onPressed: () {
                                                controller
                                                        .isVisibleNameDetailsDialog =
                                                    false;
                                                controller.update();
                                              },
                                              icon: const Icon(Icons.close)),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        CustomText(
                                            text:
                                                'الاسم $selectedName مشتق على الوزن ( ${snapshot.data?[0]})  من الجذر (${snapshot.data?[1].replaceAll('1', '')}) وهو جذر (${snapshot.data?[2] == 'معروف' ? 'مستخدم' : 'غير مستخدم'} ) في اللغة العربية. لمعرفة معنى الجذر إن كان مستخدما ارجع على موقع almaany.com.  إذا أعجبك هذا الاشتقاق وترى أنه يصلح اسم لشخص انقر على أيقونة شارك لمشاركته مع الآخرين في صورة.'),
                                      ],
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return CustomText(
                                      text: snapshot.error.toString());
                                } else {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                              }),
                        ),
                      ],
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
