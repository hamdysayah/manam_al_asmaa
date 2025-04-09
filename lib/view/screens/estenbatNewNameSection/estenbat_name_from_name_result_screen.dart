import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manjam_asmaa/medel/namesModel.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';

class EstenbatNameFromNameResultScreen extends StatelessWidget {
  AppController appController = Get.find();
  String selectedName = '';
  var scaffoldKey = GlobalKey<ScaffoldState>();

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
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomText(
                        text: 'اسم مشتق من جذر معين',
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
                    height: 20.h,
                  ),
                  Container(),
                  SizedBox(
                    height: 10.h,
                  ),

                  Container(),
                  CustomText(
                    text: 'الاسماء المشتقه من جذر الاسم ${Get.arguments}',
                    fontSize: 20.sp,
                  ),
                  GetBuilder<AppController>(builder: (controller) {
                    return FutureBuilder<List<String>>(
                        future: DatabaseQueries()
                            .getEstenatRootForNameAndAllName(Get.arguments),
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
                                            border: Border.all(
                                                color: Colors.white60),
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
                              color: Colors.black,
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
