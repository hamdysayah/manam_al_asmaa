import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manjam_asmaa/view/screens/help_screen.dart';
import 'package:manjam_asmaa/view/screens/home_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/utils/constants.dart';
import 'custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/Background_drawer.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage("assets/images/drawer_header.png"),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo_for_drawer.png',
                          width: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 7.h),
                          child: CustomText(
                            text: 'منجم الآسماء',
                            fontSize: 10.sp,
                            textColor: Colors.white,
                            fontFamily: 'BIXIE_Regular',
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        CustomText(
                          text: 'اهلا بك',
                          fontSize: 25.sp,
                          textColor: Colors.white,
                        ),
                      ],
                    )
                  ],
                )),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Color(kPrimaryColor),
              ),
              title: CustomText(
                textColor: Colors.white,
                textAlign: TextAlign.right,
                text: 'الصفحة الرئيسية',
                fontSize: 20.sp,
              ),
              onTap: () {
                Get.offAll(HomeScreen());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                color: Color(kPrimaryColor),
              ),
              title: CustomText(
                textColor: Colors.white,
                textAlign: TextAlign.right,
                text: 'المساعدة',
                fontSize: 20.sp,
              ),
              onTap: () {
                Get.to(HelpPage());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.share,
                color: Color(kPrimaryColor),
              ),
              title: CustomText(
                textColor: Colors.white,
                textAlign: TextAlign.right,
                text: 'شارك',
                fontSize: 20.sp,
              ),
              onTap: () {
                SharePlus.instance.share(ShareParams(
                  text: Platform.isAndroid
                      ? 'ابحث واكتشف  المزيد في منجم  الاسماء حمل التطبيق من الرابط التالي : https://play.google.com/store/apps/details?id=com.almaany.manjam_asmaa.manjam_asmaa '
                      : 'ابحث واكتشف  المزيد في منجم  الاسماء حمل التطبيق من الرابط التالي :https://apps.apple.com/us/app/id987229874 ',
                  sharePositionOrigin:
                      Rect.fromPoints(const Offset(2, 2), const Offset(3, 3)),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
