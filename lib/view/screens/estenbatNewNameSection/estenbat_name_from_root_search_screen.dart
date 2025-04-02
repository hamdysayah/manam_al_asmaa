import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/controller/app_contrller.dart';
import 'package:manjam_asmaa/view/widgets/custom_button.dart';

import '../../widgets/custom_text_field.dart';
import 'estenbat_name_from_root_result_screen.dart';

class estenbat_name_from_root_search_screen extends StatelessWidget {
  String char1 = '',
      char2 = '',
      char3 = '';

  TextEditingController textEditingController1 = TextEditingController(),
      textEditingController2 = TextEditingController(),
      textEditingController3 = TextEditingController();

  AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاشتقاق من خلال جذر ثلاثي'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              GetBuilder<AppController>(builder: (controller) {
                return Expanded(
                    child: CustomTextField(
                      textEditingController: textEditingController1,
                      hintText: 'الحرف الاول',
                      showSuffixIcon: appController.showSuffixText1,
                      suffixIconClick: () {
                        textEditingController1.clear();
                        appController.showSuffixText1 = false;
                        appController.update();
                      },
                      onChanged: (value) {
                        char1 = value;
                        value.isNotEmpty
                            ? appController.showSuffixText1 = true
                            : appController.showSuffixText1 = false;
                        appController.update();
                      },
                    ));
              }),

              SizedBox(
                width: 10.w,
              ),
              GetBuilder<AppController>(builder: (contoller) {
                return Expanded(
                  child: Expanded(
                      child: CustomTextField(
                        textEditingController: textEditingController2,
                        hintText: 'الحرف الثاني',
                        suffixIconClick: () {
                          textEditingController2.clear();
                          appController.showSuffixText2 = false;
                          appController.update();
                        },
                        showSuffixIcon: appController.showSuffixText2,
                        onChanged: (value) {
                          char2 = value;
                          value.isNotEmpty
                              ? appController.showSuffixText2 = true
                              : appController.showSuffixText2 = false;
                          appController.update();
                        },
                      )),
                );
              }),

              SizedBox(
                width: 10.w,
              ),
              GetBuilder<AppController>(builder: (controller) {
                return Expanded(
                    child: CustomTextField(
                      textEditingController: textEditingController3,
                      hintText: 'الحرف الثالث',
                      suffixIconClick: () {
                        textEditingController3.clear();
                        appController.showSuffixText3 = false;
                        appController.update();
                      },
                      showSuffixIcon: appController.showSuffixText3,
                      onChanged: (value) {
                        char3 = value;
                        value.isNotEmpty
                            ? appController.showSuffixText3 = true
                            : appController.showSuffixText3 = false;
                        appController.update();
                      },
                    ));
              }),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          customButton(
              text: 'بحث',
              buttonWidth: 150.w,
              onClick: () {
                Get.to(EstenbatNameFromRootResultScreen(),
                    arguments: [char1, char2, char3]);
              })
        ],
      ),
    );
  }
}
