import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/controller/app_contrller.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/widgets/custom_button.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import 'estenbat_name_from_root_result_screen.dart';

class estenbat_name_from_root_search_screen extends StatelessWidget {
  String char1 = '', char2 = '', char3 = '';

  TextEditingController textEditingController1 = TextEditingController(),
      textEditingController2 = TextEditingController(),
      textEditingController3 = TextEditingController();

  AppController appController = Get.find();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
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

              // باقي التصميم
              Container(),

              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: 'ابتكر اسمًا فريدًا لطفلك من جذر معين',
                fontWight: FontWeight.bold,
                textColor: Colors.white,
                fontSize: 25.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.all(5.w),
                child: CustomText(
                  textColor: Colors.white60,
                  text: 'أدخل الجذر "ر ه ف" لنبتكر اسم مثل : استرهاف  , رهيف',
                  fontWight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

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
                        char1 = '';
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
                      child: CustomTextField(
                        textEditingController: textEditingController2,
                        hintText: 'الحرف الثاني',
                        suffixIconClick: () {
                          textEditingController2.clear();
                          appController.showSuffixText2 = false;
                          char2 = '';
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
                      ),
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
                        char3 = '';
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
                    if (char1 != '' && char2 != '' && char3 != '') {
                      Get.to(EstenbatNameFromRootResultScreen(),
                          arguments: [char1, char2, char3]);
                    } else {
                      showToast('الرجاء ادخال جميع الحقول');
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
