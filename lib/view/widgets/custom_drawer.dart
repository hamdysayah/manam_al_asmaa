import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100.h,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: CustomText(
                text: 'منجم الآسماء',
                fontSize: 20.sp,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: CustomText(
              textAlign: TextAlign.right,
              text: 'الصفحة الرئيسية',
              fontSize: 20.sp,
            ),
            onTap: (){
              /// Close Navigation drawer before
            },
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),

            title: CustomText(
              textAlign: TextAlign.right,
              text: 'الصفحة الرئيسية',
              fontSize: 20.sp,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: CustomText(
              textAlign: TextAlign.right,
              text: 'تواصل',
              fontSize: 20.sp,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),

          ListTile(
            title: CustomText(
              textAlign: TextAlign.right,
              text: 'مساعدة',
              fontSize: 20.sp,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: CustomText(
              textAlign: TextAlign.right,
              text: 'شارك',
              fontSize: 20.sp,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: CustomText(
              textAlign: TextAlign.right,
              text: 'شراء نسخه بدون اعلانات',
              fontSize: 20.sp,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
