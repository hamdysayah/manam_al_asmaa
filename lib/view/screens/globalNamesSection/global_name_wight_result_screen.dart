import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manjam_asmaa/medel/namesModel.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';
import '../../../core/utils/constants.dart';

class GlobalNameWightResultScreen extends StatelessWidget {
  var theNamesList = [];
  AppController appController = Get.find();
  String selectedName = '';
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    appController.isVisibleNameDetailsDialog = false;
    return Scaffold(
      drawer: CustomDrawer(),
      key: scaffoldKey,
      body: Container(
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
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // الهيدر
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomText(
                        text: 'البحث في الاسماء المستخدمة',
                        textColor: Colors.white,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                            padding: EdgeInsets.only(left: 10.w),
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'assets/images/drawer_open_icon.png',
                              scale: 0.8,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(),
                  CustomText(
                    text: ' اسماء على وزن ${Get.arguments[0]}',
                    fontSize: 20.sp,
                  ),
                  FutureBuilder<List<String>>(
                      future: DatabaseQueries().getNamesFromWight(
                          Get.arguments[0], Get.arguments[1]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isNotEmpty) {
                            theNamesList = snapshot.data!;
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
                                      (MediaQuery.of(context).size.height / 5),
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      selectedName = theNamesList[index]
                                          .toString()
                                          .replaceAll(' ', '')
                                          .replaceAll('[', '')
                                          .replaceAll(']', '');

                                      appController.isVisibleNameDetailsDialog =
                                          true;
                                      appController.update();
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              end: Alignment.topLeft,
                                              colors: [
                                                Color(0xFF020202),
                                                Color(0xFF292A2D),
                                              ]),
                                          border: Border.all(
                                              color: Color(0xFF585858),
                                              width: 2),
                                        ),
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
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
                            return Expanded(
                                child: CustomText(text: 'لا يوجد نتائج'));
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
                      }),
                ],
              ),
            ),

           // عرض محتوى الاسم

            //عرض تفاصيل الاسم
            GetBuilder<AppController>(builder: (controller) {
              return Visibility(
                  visible: controller.isVisibleNameDetailsDialog,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(),
                        Screenshot(
                          controller: _screenshotController,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Color(0xFF020202),
                                    Color(0xFF292A2D),
                                  ]),
                              border: Border.all(
                                  color: Color(0xFF585858), width: 2),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              color: Colors.black,
                            ),
                            //width: 300.w,
                            //  height: 300.h,
                            child: FutureBuilder<Namesmodel>(
                                future: DatabaseQueries()
                                    .getNameDetails(selectedName),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        // الشكل الذي سيتم مشاركته
                                        Container(
                                          width: double.infinity,
                                          height: 200.h,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/drawer_header.png"),
                                                  fit: BoxFit.cover)),
                                          child: Column(
                                            children: [
                                              // ايقونة اغلاق الديالوج
                                              Container(
                                                alignment: Alignment.topRight,
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller
                                                          .isVisibleNameDetailsDialog =
                                                      false;
                                                      controller.update();
                                                    },
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    )),
                                              ),

                                              // اسم الشخص
                                              CustomText(
                                                text:
                                                ' ${snapshot.data!.name}',
                                                fontSize: 90.sp,
                                                fontFamily: 'BIXIE_Regular',
                                              ),
                                              // نوع الاسم
                                              CustomText(
                                                text:
                                                '${snapshot.data!.typeOfName}',
                                                fontWight: FontWeight.bold,
                                                fontSize: 20.sp,
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        // الوزن الفعل الاصل
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0XFF1C1A1A),
                                                    border: Border.all(
                                                        color:
                                                        Color(0xFF585858),
                                                        width: 1),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            7))),
                                                padding: EdgeInsets.only(
                                                    right: 20.w, left: 20.w),
                                                height: 70.h,
                                                alignment: Alignment.center,
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    CustomText(text: 'الوزن'),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    CustomText(
                                                        text: snapshot.data!
                                                            .nameWight ==
                                                            '1'
                                                            ? '_'
                                                            : snapshot.data!
                                                            .nameWight),
                                                  ],
                                                )),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            // الجذر
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0XFF1C1A1A),
                                                    border: Border.all(
                                                        color:
                                                        Color(0xFF585858),
                                                        width: 1),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            7))),
                                                padding: EdgeInsets.only(
                                                    right: 20.w, left: 20.w),
                                                height: 70.h,
                                                alignment: Alignment.center,
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    CustomText(
                                                        text: 'الجذر '),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    CustomText(
                                                        text:
                                                        '${snapshot.data!.root}'),
                                                  ],
                                                )),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            // الاصل
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0XFF1C1A1A),
                                                    border: Border.all(
                                                        color:
                                                        Color(0xFF585858),
                                                        width: 1),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            7))),
                                                padding: EdgeInsets.only(
                                                    right: 20.w, left: 20.w),
                                                height: 70.h,
                                                alignment: Alignment.center,
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    CustomText(
                                                        text: 'الاصل '),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    CustomText(
                                                        fontSize: 18.sp,
                                                        text:
                                                        '  ${snapshot.data!.origin}'),
                                                  ],
                                                )),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child: CustomText(
                                            textAlign: TextAlign.right,
                                            text:
                                            'المعنى :  \n${snapshot.data!.meaning}',
                                            fontWight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    );
                                  } else if (snapshot.hasError) {
                                    return CustomText(
                                        text: snapshot.error.toString());
                                  } else {
                                    return Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
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
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //زر مشاركة كصورة
                        InkWell(
                          onTap: () {
                            takeScreenshot(_screenshotController);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 30.w, left: 30.w),
                            height: 45.h,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment(0.9, 0.1),
                                    colors: [
                                      Color(0xFF7060D4),
                                      Color(0xFF9785EE),
                                    ]),
                                border: Border.all(color: Color(0xFF9785EE)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                CustomText(
                                  text: 'مشاركة الاسم كصورة',
                                  textColor: Colors.white,
                                  fontWight: FontWeight.bold,
                                  fontSize: 17.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
