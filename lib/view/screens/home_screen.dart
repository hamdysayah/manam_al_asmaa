import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/screens/globalNamesSection/type_of_search_global_name_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../controller/app_contrller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_drawer.dart';
import 'estenbatNewNameSection/type_of_search_entenbat_name_screen.dart';

class HomeScreen extends StatelessWidget {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appController.scaffoldKey,
      drawer: const CustomDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home_screen_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      appController.openDrawer();
                    },
                    child: Container(
                        padding: EdgeInsets.only(right: 10.w, top: 10.h),
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'assets/images/drawer_open_icon.png',
                          scale: 0.7,
                        )),
                  ),
                  Spacer(),
                  CustomText(
                    fontSize: 35.sp,
                    text: 'منجم الآسماء',
                    textColor: Colors.white,
                    fontFamily: 'BIXIE_Regular',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset(
                    'assets/images/logo_for_drawer.png',
                    width: 28.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      text: 'homeScreenTitle'.tr,
                      fontSize: 25.sp,
                      textColor: Colors.white,
                      fontWight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text: 'homeScreenDescriptionApp'.tr,
                      fontSize: 15.sp,
                      textColor: Colors.white,
                      fontWight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    // زر الاول
                    InkWell(
                      onTap: () {
                        Get.to(TypeOfSearchGlobalNameScreen());
                      },
                      child: Container(
                        width: 290.w,
                        height: 45.h,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment(0.9, 0.1),
                                colors: [
                                  Color(0xFF7060D4),
                                  Color(0xFF9785EE),
                                ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.groups,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              text: 'اختر من الاسماء المستخدمة',
                              textColor: Colors.white,
                              fontWight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),

                    // زر الثاني
                    InkWell(
                      onTap: () {
                        Get.to(TypeOfSearchEntenbatNameScreen());
                      },
                      child: Container(
                        width: 290.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF9785EE)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset(
                              'assets/images/Icon_star.png',
                              color: Color(0xFF9785EE),
                              scale: 1.8,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              text: 'ابتكر اسم جديد من جذور لغتنا العربية',
                              textColor: Color(0xFF9785EE),
                              fontWight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
