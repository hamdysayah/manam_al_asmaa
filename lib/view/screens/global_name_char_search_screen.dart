import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../../controller/app_contrller.dart';
import '../widgets/custom_button.dart';
import 'global_name_char_result_screen.dart';

class GlobalNameCharSearchScreen extends StatelessWidget {
  AppController appController = Get.find();

  List<int> typeOfSearch = [1, 2, 3];
  int currentOption = 1;

  String nameFromTextField = '';
  var _controller = TextEditingController();

  List<String> maleOrFemaleList = ['مذكر', 'مؤنث'];
  String genderCurrentOption = 'مذكر';

  @override
  Widget build(BuildContext context) {
    currentOption = typeOfSearch[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('منجم الاسماء'),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          SizedBox(
            height: 100.h,
          ),
          Row(
            children: [
              GetBuilder<AppController>(builder: (controller) {
                return Expanded(
                  flex: 4,
                  child: Padding(
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
                          appController.update();
                          Get.to(GlobalCharNameResultScreen(), arguments: [
                            currentOption,
                            nameFromTextField,
                            genderCurrentOption
                          ]);
                        },
                        autofocus: true,
                        onChanged: (value) {
                          nameFromTextField = value;
                          appController.update();
                        },
                        decoration: InputDecoration(
                            suffixIcon: nameFromTextField.isNotEmpty
                                ? InkWell(
                                    onTap: () {
                                      _controller.clear();
                                      nameFromTextField='';
                                      appController.update();
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Colors.black,
                                    ),
                                  )
                                : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'ابحث هنا...',
                            hintStyle: TextStyle(
                                //     color: appController.isDark ? Colors.white : Colors.black,
                                )),
                      ),
                    ),
                  ),
                );
              }),

              // زر ابحث
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 10.w),
                child: Container(
                  width: 80.w,
                  height: 50.h,
                  child: customButton(
                      text: 'بحث',
                      buttonWidth: 100.w,
                      onClick: () {
                        _controller.clear();
                        appController.update();
                        Get.to(GlobalCharNameResultScreen(), arguments: [
                          currentOption,
                          nameFromTextField,
                          genderCurrentOption
                        ]);
                      }),
                ),
              ),
            ],
          ),

          // خيار مذكر او مؤنث
          GetBuilder<AppController>(builder: (controller) {
            return Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: maleOrFemaleList[0],
                    groupValue: genderCurrentOption,
                    onChanged: (value) {
                      genderCurrentOption = value!.toString();
                      appController.update();
                    },
                    title: Text('مذكر'),
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: maleOrFemaleList[1],
                    groupValue: genderCurrentOption,
                    onChanged: (value) {
                      genderCurrentOption = value.toString();
                      appController.update();
                    },
                    title: Text('مؤنث'),
                  ),
                )
              ],
            );
          }),
          GetBuilder<AppController>(builder: (controller) {
            return Expanded(
              child: Column(
                children: [
                  RadioListTile(
                    value: typeOfSearch[0],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('اسماء تبدا ب.. '),
                  ),
                  RadioListTile(
                    value: typeOfSearch[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('اسماء تنتهي ب..'),
                  ),
                  RadioListTile(
                    value: typeOfSearch[2],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('اسماء تحتوي على ..'),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
