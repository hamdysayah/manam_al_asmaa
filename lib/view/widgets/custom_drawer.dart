import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage("assets/images/drawer_header.png"),
                        fit: BoxFit.cover)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: 'منجم الآسماء',
                          fontSize: 25.sp,
                          textColor: Colors.white,
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
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.call,
                color: Color(kPrimaryColor),
              ),
              title: CustomText(
                textColor: Colors.white,
                textAlign: TextAlign.right,
                text: 'تواصل',
                fontSize: 20.sp,
              ),
              onTap: () {},
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
                // Update the state of the app.
                // ...
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
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.camera_outlined,
                color: Color(kPrimaryColor),
              ),
              title: CustomText(
                textColor: Colors.white,
                textAlign: TextAlign.right,
                text: 'شراء نسخه بدون اعلانات',
                fontSize: 20.sp,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
