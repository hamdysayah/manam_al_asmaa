import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../../controller/app_contrller.dart';
import '../../widgets/custom_button.dart';
import 'global_name_char_result_screen.dart';

class GlobalNameCharSearchScreen extends StatelessWidget {
  AppController appController = Get.find();

  List<int> typeOfSearch = [1, 2, 3];
  List<String> typeOfSearchTitle = [
    'الاسم يبدأ بحرف معين او أكثر',
    'الاسم ينتهي بحرف معين أو اكثر',
    'الاسم يحتوي على حرف معين أو اكثر'
  ];

  List<String> typeOfSearchSubTitle = [
    'أدخل حرف “ت” لتظهر اسماء مثل : تامر , تالا , تيم',
    'أدخل حرف “ن” لتظهر اسماء مثل :ريان,عدنان ,حسن',
    'أدخل حرف “م” لتظهر اسماء مثل :محمد , مريم , مرام'
  ];
  int currentOption = 1;

  String nameFromTextField = '';
  var _controller = TextEditingController();

  List<String> maleOrFemaleList = ['مذكر', 'مؤنث'];
  String genderCurrentOption = 'مذكر';
  var scaffoldKey = GlobalKey<ScaffoldState>();

  int genderSelectedItem = 0;

  @override
  Widget build(BuildContext context) {
    currentOption = typeOfSearch[0];
    return Scaffold(
      drawer: CustomDrawer(),
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                'assets/images/A_and_B_Icon.png',
                color: Colors.white,
                scale: 0.8,
              ),

              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: 'ابحث عن اسم لطفلك بناء \nعلى الحروف التي تفضلها',
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
                  textColor: Colors.white,
                  text:
                      'ابحث عن الاسم من خلال حرف يبدا به الاسم او حرفين او ثلاثة وكذلك الامر لحرف ينتهي به او يحتويه الاسم',
                  fontWight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  GetBuilder<AppController>(builder: (controller) {
                    return Expanded(
                      flex: 4,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 5, left: 5),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            controller: _controller,
                            style: TextStyle(
                                fontSize: 17.sp, color: Colors.white60),
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                nameFromTextField = '';
                                _controller.clear();
                                appController.update();
                                Get.to(GlobalCharNameResultScreen(),
                                    arguments: [
                                      currentOption,
                                      value,
                                      genderCurrentOption
                                    ]);
                              } else {
                                showToast('الرجاء ادخال الحروف');
                              }
                            },
                            onTapOutside: (s) {
                              FocusScope.of(context).unfocus();
                            },
                            autofocus: false,
                            onChanged: (value) {
                              nameFromTextField = value;
                              appController.update();
                            },
                            decoration: InputDecoration(
                                suffixIcon: nameFromTextField.isNotEmpty
                                    ? InkWell(
                                        onTap: () {
                                          _controller.clear();
                                          nameFromTextField = '';
                                          appController.update();
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Colors.black,
                                        ),
                                      )
                                    : null,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff7B7B7B), width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xff7B7B7B), width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'ادخل الاحرف الذي تريدها هنا',
                                hintStyle: TextStyle(
                                    color: Colors.white54,
                                    fontFamily: 'ZainRegular')),
                          ),
                        ),
                      ),
                    );
                  }),

                  // زر ابحث
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 10.w),
                    child: Container(
                      height: 50.h,
                      child: customButton(
                          text: 'بحث',
                          buttonWidth: 100.w,
                          onClick: () {
                            if (nameFromTextField.isNotEmpty) {
                              String text = nameFromTextField;
                              nameFromTextField = '';
                              _controller.clear();
                              appController.update();
                              Get.to(GlobalCharNameResultScreen(), arguments: [
                                currentOption,
                                text,
                                genderCurrentOption
                              ]);
                            } else {
                              showToast('الرحاء ادخال الحروف');
                            }
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              // خيار مذكر او مؤنث
              GetBuilder<AppController>(builder: (controller) {
                return Container(
                  height: 40.h,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            genderCurrentOption = 'مذكر';
                            genderSelectedItem = 0;
                            appController.update();
                          } else {
                            genderCurrentOption = 'مؤنث';
                            genderSelectedItem = 1;

                            appController.update();
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: genderSelectedItem == index
                                    ? LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment(0.9, 0.1),
                                        colors: [
                                            Color(0xFF7060D4),
                                            Color(0xFF9785EE),
                                          ])
                                    : null,
                                border: genderSelectedItem != index
                                    ? Border.all(color: Color(0xFF7060D4))
                                    : null,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 30.w),
                            width: 130.w,
                            height: 50.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomText(text: maleOrFemaleList[index]),
                                Icon(
                                  index == 0 ? Icons.male : Icons.female,
                                  color: genderSelectedItem == index
                                      ? Colors.white
                                      : Color(0xFF7060D4),
                                )
                              ],
                            )),
                      );
                    },
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                  ),
                );
              }),

              SizedBox(
                height: 30.h,
              ),
              // الاختيارات تبدا او تنتهي بحرف
              GetBuilder<AppController>(builder: (controller) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          currentOption = ++index;
                          appController.update();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: currentOption - 1 == index
                                  ? const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment(0.9, 0.1),
                                      colors: [
                                          Color(0xFF7060D4),
                                          Color(0xFF9785EE),
                                        ])
                                  : null,
                              border: Border.all(color: Color(0xFF7060D4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.only(
                              right: 20.w, left: 20.w, top: 10.h, bottom: 10.h),
                          child: Row(
                            children: [
                              Icon(
                                currentOption - 1 == index
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                children: [
                                  // العنوان
                                  CustomText(
                                    text: typeOfSearchTitle[index],
                                    textAlign: TextAlign.right,
                                  ),
                                  // العنوان الفرعي
                                  CustomText(
                                      textAlign: TextAlign.right,
                                      fontSize: 12.sp,
                                      text: typeOfSearchSubTitle[index]),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
