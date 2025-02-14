import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manjam_asmaa/medel/namesModel.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../controller/app_contrller.dart';
import '../../core/database/database_queries.dart';

class GlobalCharNameResultScreen extends StatelessWidget {
  AppController appController = Get.find();
  String selectedName = '';

  @override
  Widget build(BuildContext context) {
    appController.isVisibleDialog=false;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(),
                CustomText(
                  text: 'الاسماء المقترحة',
                  fontSize: 20.sp,
                ),
                GetBuilder<AppController>(builder: (controller) {
                  return FutureBuilder<List<String>>(
                      future: DatabaseQueries().getGlobalNamesFirstThreeOptions(
                          Get.arguments[1].toString(), Get.arguments[0]),
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
                                      //لما يختار الاسم
                                      child: InkWell(
                                        onTap: () {
                                          selectedName = theNamesList[index]
                                              .toString()
                                              .replaceAll(' ', '')
                                              .replaceAll('[', '')
                                              .replaceAll(']', '');

                                          appController.isVisibleDialog = true;
                                          appController.update();
                                        },
                                        child: CustomText(
                                          text: theNamesList[index]
                                              .toString()
                                              .replaceAll('[', '')
                                              .replaceAll(']', ''),
                                        ),
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

            //عرض تفاصيل الاسم
            GetBuilder<AppController>(builder: (controller) {
              return Visibility(
                  visible: controller.isVisibleDialog,
                  child: Column(
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
                        //  height: 300.h,
                        child: FutureBuilder<Namesmodel>(
                            future:
                                DatabaseQueries().getNameDetails(selectedName),
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
                                              controller.isVisibleDialog =
                                                  false;
                                              controller.update();
                                            },
                                            icon: const Icon(Icons.close)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          CustomText(
                                              text:
                                                  'الاسم : ${snapshot.data!.name}'),
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          CustomText(
                                              text:
                                                  'النوع : ${snapshot.data!.typeOfName}'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          CustomText(
                                              text:
                                                  'الوزن  : ${snapshot.data!.nameWight}'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                              text:
                                                  'الجذر : ${snapshot.data!.root}'),
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          CustomText(
                                              text:
                                                  'الاصل : ${snapshot.data!.origin}'),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                        ],
                                      ),
                                      CustomText(
                                        text:
                                            'المعنى : ${snapshot.data!.meaning}',
                                        fontWight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return CustomText(
                                    text: snapshot.error.toString());
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
                            }),
                      ),
                    ],
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
