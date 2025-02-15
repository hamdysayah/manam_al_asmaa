import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:screenshot/screenshot.dart';

import '../../controller/app_contrller.dart';
import '../../core/database/database_queries.dart';
import '../widgets/custom_button.dart';
import 'global_name_char_result_screen.dart';
import 'global_name_wight_result_screen.dart';

class GlobalNameWightSearchScreen extends StatelessWidget {
  AppController appController = Get.find();

  List<int> maleOrFemaleList = [1, 2];
  int currentOption = 1;

  String nameFromTextField = '';

  String dropdownvalue = 'اختر الوزن';

  // List of items in our dropdown menu
  var items = [
    'اختر الوزن',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    currentOption = maleOrFemaleList[0];
    return Scaffold(
        appBar: AppBar(
          title: Text('منجم الاسماء'),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                CustomText(
                  text:
                      'ابحث من خلال الاسم وسيتم عرض جميع الاسماء التي تحمل نفس الوزن للاسم الذي ادخلته',
                  fontWight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GetBuilder<AppController>(builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(
                          fontSize: 17.sp,
                          //    color: appController.isDark ? Colors.white : Colors.black,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {
                          nameFromTextField = value;
                          _controller.clear();
                          controller.update();
                          Get.to(GlobalCharNameResultScreen(),
                              arguments: [currentOption, nameFromTextField]);
                        },
                        autofocus: true,
                        onChanged: (value) {
                          nameFromTextField = value;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'ادخل الاسم',
                            hintStyle: TextStyle(
                                //     color: appController.isDark ? Colors.white : Colors.black,
                                )),
                      ),
                    ),
                  );
                  // الخيارات
                }),
                GetBuilder<AppController>(builder: (controller) {
                  return Expanded(
                    child: Column(
                      children: [
                        RadioListTile(
                          value: maleOrFemaleList[0],
                          groupValue: currentOption,
                          onChanged: (value) {
                            currentOption = value!.toInt();
                            appController.update();
                          },
                          title: Text('مذكر'),
                        ),
                        RadioListTile(
                          value: maleOrFemaleList[1],
                          groupValue: currentOption,
                          onChanged: (value) {
                            currentOption = value!.toInt();
                            appController.update();
                          },
                          title: Text('مؤنث'),
                        ),
                        customButton(
                            text: 'بحث',
                            buttonWidth: 200.w,
                            onClick: () {
                              _controller.clear();
                              appController.update();
                              Get.to(GlobalCharNameResultScreen(), arguments: [
                                currentOption,
                                nameFromTextField
                              ]);
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        // الفاصل
                        Row(children: <Widget>[
                          Expanded(child: Divider()),
                          CustomText(
                            text: "او",
                            fontSize: 20.sp,
                          ),
                          Expanded(child: Divider()),
                        ]),
                        //البحث من خلال الوزن
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                            text:
                                'قم باختيار الوزن وسيظهر جميع الاسماء التي تحمل نفس الو'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            customButton(
                                text: 'اختر الوزن',
                                buttonWidth: 200.w,
                                onClick: () {}),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        )),
                      ],
                    ),
                  );
                }),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 300.w,
              height: 300.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //عرض ديالوج للاوزان
                  Container(),
                  CustomText(
                    text: 'اختر الوزن',
                    fontSize: 20.sp,
                    fontWight: FontWeight.bold,
                  ),
                  FutureBuilder<List<String>>(
                      future: DatabaseQueries().getWightsFromDb(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isNotEmpty) {
                            var theWightList = [];
                            theWightList = snapshot.data!;
                            return Expanded(
                              child: GridView.builder(
                                itemCount: theWightList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 2,
                                  childAspectRatio: MediaQuery.of(context)
                                          .size
                                          .width /
                                      (MediaQuery.of(context).size.height / 5),
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(GlobalNameWightResultScreen(),
                                          arguments: theWightList[index]
                                              .toString()
                                              .replaceAll('[', '')
                                              .replaceAll(']', ''));
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        //لما يختار الاسم
                                        child: CustomText(
                                          text: theWightList[index]
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
                      }),
                ],
              ),
            )
          ],
        ));
  }
}
