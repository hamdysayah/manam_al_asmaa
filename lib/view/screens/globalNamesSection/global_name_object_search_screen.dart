import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/view/screens/globalNamesSection/global_name_object_result_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';

import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';

class GlobalNameObjectSearchScreen extends StatelessWidget {
  AppController appController = Get.find();
  String dropdownvalue = 'اختر الموضوع';
  var objectList = [
    'اختر الموضوع',
  ];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
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
              // باقي التصميم
              Container(),

              SizedBox(
                height: 30.h,
              ),
              Image.asset(
                'assets/images/object_search_icon.png',
                color: Colors.white,
                scale: 0.8,
              ),

              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: 'اختر اسم مولودك بناءً على الموضوع \nالذي تفضله!',
                fontWight: FontWeight.bold,
                textColor: Colors.white,
                fontSize: 22.sp,
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.all(5.w),
                child: CustomText(
                  fontSize: 15.sp,
                  textColor: Colors.white60,
                  text:
                      'ابحث عن الاسم من خلال لالموضوع , اختر فئة الأسماء التي تناسب ذوقك مثل الكرم القبول التضحية إلخ ...',
                  fontWight: FontWeight.bold,
                ),
              ),

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
                                childAspectRatio: MediaQuery.of(context)
                                        .size
                                        .width /
                                    (MediaQuery.of(context).size.height / 5),
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(GlobalObjectNameResultScreen(),
                                        arguments: objectList[index]);
                                  },
                                  child: Container(
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(5),
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
      ),
    );
  }
}
