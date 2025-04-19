import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manjam_asmaa/medel/namesModel.dart';
import 'package:manjam_asmaa/view/widgets/custom_button.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';
import '../../../core/utils/constants.dart';
import '../../widgets/custom_banner.dart';

class EstenbatNameFromLastTowcharRootResultScreen extends StatelessWidget {
  AppController appController = Get.find();
  String selectedName = '';
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final _screenshotController = ScreenshotController();
  bool likeButtonIsVisible = true;

  @override
  Widget build(BuildContext context) {
    appController.isVisibleNameDetailsDialog = false;
    return Scaffold(
      drawer: const CustomDrawer(),
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
        child: SafeArea(
          child: Stack(
            children: [
              Column(
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              text: 'اسم مشتق من جذر معين',
                              textColor: Colors.white,
                            ),
                          ],
                        ),
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
                  Container(),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    text:
                        'الاسماء المشتقة من جذر اخره الحرفين (${Get.arguments[0] + Get.arguments[1]}) على الوزن (${Get.arguments[3]}) انقر على الاسم لمعرفة تفاصيله ',
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GetBuilder<AppController>(builder: (controller) {
                    return FutureBuilder<List<String>>(
                        future: DatabaseQueries()
                            .getNamesFromLastTowCharAndWightEstenbat(
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
                                            5),
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
                            return Expanded(child: CustomText(text: snapshot.error.toString()));
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
                  SizedBox(
                    height: 10.h,
                  ),
                  MyBannerAd()
                ],
              ),

              // عرض تفاصيل الآسم
              GetBuilder<AppController>(builder: (controller) {
                return Visibility(
                    visible: controller.isVisibleNameDetailsDialog,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Color(0xFF020202),
                                    Color(0xFF292A2D),
                                  ]),
                              border: Border.all(
                                  color: const Color(0xFF585858), width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.black,
                            ),
                            //width: 300.w,
                            //  height: 300.h,
                            child: FutureBuilder<List<String>>(
                                future: DatabaseQueries()
                                    .getResultFormEstenbatWithNoWight(
                                        selectedName, Get.arguments[2]),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        // الشكل الذي سيتم مشاركته
                                        Screenshot(
                                          controller: _screenshotController,
                                          child: Container(
                                            width: double.infinity,
                                            //  height: 200.h,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/drawer_header.png"),
                                                    fit: BoxFit.cover)),
                                            child: Column(
                                              children: [
                                                // اسم الشخص
                                                CustomText(
                                                  text: ' $selectedName',
                                                  fontSize: 90.sp,
                                                  fontFamily: 'BIXIE_Regular',
                                                ),

                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.w),
                                                  child: CustomText(
                                                    textColor: Colors.white,
                                                    text: 'المعنى :',
                                                    fontSize: 20.sp,
                                                    fontWight: FontWeight.bold,
                                                  ),
                                                ),

                                                CustomText(
                                                  fontSize: 17.sp,
                                                  fontWight: FontWeight.bold,
                                                  text:
                                                      'الاسم $selectedName مشتق على الوزن ( ${snapshot.data?[0]})  من الجذر (${snapshot.data?[1].replaceAll('1', '')}) وهو جذر (${snapshot.data?[2] == 'معروف' ? 'مستخدم' : 'غير مستخدم'} ) في اللغة العربية.\n\n ',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(),
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: '',
                                                  style: TextStyle(
                                                      fontFamily: 'ZainRegular',
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          ' لمعرفة معنى الجذر  إن كان مستخدما ارجع على موقع ',
                                                    ),
                                                    TextSpan(
                                                      text: 'almaany.com\n\n',
                                                      style: TextStyle(
                                                        color: Color(
                                                            kPrimaryColor),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 21,
                                                      ),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              launchUrlFunc(
                                                                  'https://www.almaany.com/');
                                                            },
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            ' إذا أعجبك هذا الاشتقاق وترى أنه يصلح اسم لشخص انقر على زر آعجبني '),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
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
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              //زر مشاركة كصورة
                              InkWell(
                                onTap: () {
                                  takeScreenshot(_screenshotController);
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.only(right: 30.w, left: 30.w),
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment(0.9, 0.1),
                                          colors: [
                                            Color(0xFF7060D4),
                                            Color(0xFF9785EE),
                                          ]),
                                      border: Border.all(
                                          color: Colors.white24, width: 2),
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
                              SizedBox(
                                width: 10.w,
                              ),
                              // زر اعجبني
                              Visibility(
                                visible: likeButtonIsVisible,
                                child: InkWell(
                                  onTap: () async {
                                    await addOrUpdateLike(selectedName);
                                    likeButtonIsVisible = false;
                                    appController.update();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        right: 10.w, left: 10.w),
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment(0.9, 0.1),
                                            colors: [
                                              Color(0xFF7060D4),
                                              Color(0xFF9785EE),
                                            ]),
                                        border: Border.all(
                                            color: Colors.white24, width: 2),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        CustomText(
                                          text: 'اعجبني',
                                          textColor: Colors.white,
                                          fontWight: FontWeight.bold,
                                          fontSize: 17.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          // زر اغلاق
                          InkWell(
                            onTap: () {
                              controller.isVisibleNameDetailsDialog = false;
                              likeButtonIsVisible = true;
                              controller.update();
                            },
                            child: Container(
                              width: 150.w,
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
                                  CustomText(
                                    text: 'اغلاق',
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
      ),
    );
  }
}
