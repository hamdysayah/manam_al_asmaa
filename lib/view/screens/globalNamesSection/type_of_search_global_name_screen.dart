import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/controller/app_contrller.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/screens/globalNamesSection/global_name_char_search_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../widgets/custom_button.dart';
import 'global_name_object_search_screen.dart';
import 'global_name_root_search_screen.dart';
import 'global_name_wight_search_screen.dart';

class TypeOfSearchGlobalNameScreen extends StatelessWidget {
  AppController appController = Get.find();

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
            children: [
              SizedBox(height: 10.h,),
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
              Container(),
              SizedBox(
                height: 70.h,
              ),
              Icon(
                size: 30.w,
                Icons.groups,
                color: Color(kPrimaryColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: 'اختر طريقة البحث عن\n اسم طفلك',
                fontWight: FontWeight.bold,
                textColor: Colors.white,
                fontSize: 25.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: CustomText(
                  textColor: Colors.white,
                  text:
                      'حدد تفاصيل البحث التي تناسبك , سواء كنت تبحث عن اسم يحوي حرف معين , يحمل معنى معينا , او مشتق من جذر لغوي , حدد جنس المولود واتبع الخطوات البسيطة',
                  fontWight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),

              // الازرار

              InkWell(
                onTap: () {
                  Get.to(GlobalNameCharSearchScreen());
                },
                child: MyCustomButton(
                  theTitle: 'ابحث من خلال حروف الاسم',
                  subTitle: 'اسماء تبدأ , تنتهي , او تحوي على حرف معين',
                  theIconName: 'A_and_B_Icon.png',
                ),
              ),

              SizedBox(
                height: 10.h,
              ),

              InkWell(
                onTap: () {
                  Get.to(GlobalNameObjectSearchScreen());
                },
                child: MyCustomButton(
                  theTitle: 'ابحث من خلال موضوع الاسم',
                  subTitle:
                      'اختر فئة الأسماء التي تناسب ذوقك الكرم القبول إلخ ...',
                  theIconName: 'object_search_icon.png',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              InkWell(
                onTap: () {
                  Get.to(GlobalNameWightSearchScreen());
                },
                child: MyCustomButton(
                  theTitle: 'ابحث من خلال الوزن الصرفي',
                  subTitle:
                      'مثل “فعيل” , ”مفاعل” والكتير من اوزان اللغة العربية',
                  theIconName: 'wight_search_icon.png',
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(GlobalNameRootSearchScreen());
                },
                child: MyCustomButton(
                  theTitle: 'ابحث من خلال الجذر اللغوي',
                  subTitle: 'ابحث من خلال جذر معين او جذر اسم معين  تحبه',
                  theIconName: 'root_search_icon.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// زر مصمم بطريقه مخصصه
class MyCustomButton extends StatelessWidget {
  MyCustomButton({
    required this.theTitle,
    required this.subTitle,
    required this.theIconName,
  });

  String? theIconName;
  String theTitle;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 310.w,
      height: 55.h,
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Color(0xFF9785EE)),
            left: BorderSide(width: 1, color: Color(0xFF9785EE)),
            bottom: BorderSide(width: 1, color: Color(0xFF9785EE)),

            right: BorderSide(width: 5.w, color: Color(0xFF9785EE)),
          ),
        //  border: Border.all(color: Color(0xFF9785EE)),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/$theIconName'),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: theTitle,
                textColor: Colors.white,
                fontWight: FontWeight.bold,
                fontSize: 15.sp,
              ),
              //نص فرعي
              CustomText(
                text: subTitle,
                textColor: Colors.grey,
                fontWight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
