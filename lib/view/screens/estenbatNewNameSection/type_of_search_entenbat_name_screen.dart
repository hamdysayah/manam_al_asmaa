import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/controller/app_contrller.dart';
import 'package:manjam_asmaa/view/screens/estenbatNewNameSection/estenbat_name_from_name_search_screen.dart';
import 'package:manjam_asmaa/view/screens/estenbatNewNameSection/estenbat_name_from_namecheckbox_search_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../widgets/custom_banner.dart';
import 'estenbat_name_from_last_towchar_root_search_screen.dart';
import 'estenbat_name_from_root_search_screen.dart';
import 'estenbat_name_from_towchar_wight_search_screen.dart';

class TypeOfSearchEntenbatNameScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  AppController appController = Get.find();

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
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: 'ابتكر اسم جديد من جذور لغتنا العربية',
                          textColor: Colors.white,
                        ),
                      ],
                    ),
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
              // باقي التصميم
              Container(),

              SizedBox(
                height: 30.h,
              ),
              Image.asset(
                'assets/images/Icon_star.png',
                color: Color(0xFF9785EE),
                scale: 1.1,
              ),

              SizedBox(
                height: 10.h,
              ),
              CustomText(
                text: 'ابتكر اسما جديد مميز\n لطفلك!',
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
                  text:
                      ' اختر الجذر اللغوي، وسنساعدك في ابتكار أسماء جديدة ومميزة تحمل معاني جميلة ومبتكرة!',
                  fontWight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(),

              // بداية الازرار
              InkWell(
                onTap: () {
                  if (appController.showAdsIndex == 0 &&
                      appController.interstitialAd != null) {
                    appController.interstitialAd?.show();
                    appController.showAdsIndex = 4;
                    appController.loadAdInterstitial();
                    Get.to(EstenbatNameFromNameSearchScreen());
                  } else {
                    appController.showAdsIndex--;

                    Get.to(EstenbatNameFromNameSearchScreen());
                  }
                },
                child: MyCustomButton(
                    theTitle: 'اسم مشتق من جذر اسم معين تحبه',
                    subTitle:
                        'أدخل اسم "رهف" (جذره: ر  ه ف) لنبتكر  اسم مثل: مرهفة , مراهف'),
              ),

              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  if (appController.showAdsIndex == 0 &&
                      appController.interstitialAd != null) {
                    appController.interstitialAd?.show();
                    appController.showAdsIndex = 4;
                    appController.loadAdInterstitial();
                    Get.to(EstenbatNameFromNameCheckBoxSearchScreen());
                  } else {
                    appController.showAdsIndex--;

                    Get.to(EstenbatNameFromNameCheckBoxSearchScreen());
                  }
                },
                child: MyCustomButton(
                    theTitle: 'اسم مشتق على وزن اسم معين تحبه',
                    subTitle:
                        'أدخل اسم "رهف" واختر حرفين من جذره “ه ف” لنبتكر اسم مثل: شهف'),
              ),

              SizedBox(
                height: 10.h,
              ),

              InkWell(
                onTap: () {
                  if (appController.showAdsIndex == 0 &&
                      appController.interstitialAd != null) {
                    appController.interstitialAd?.show();
                    appController.showAdsIndex = 4;
                    appController.loadAdInterstitial();
                    Get.to(estenbat_name_from_root_search_screen());
                  } else {
                    appController.showAdsIndex--;

                    Get.to(estenbat_name_from_root_search_screen());
                  }
                },
                child: MyCustomButton(
                    theTitle: 'اسم مشتق من جذر معين',
                    subTitle:
                        'أدخل الجذر "ر ه ف" لنبتكر اسم مثل : استرهاف  , رهيف'),
              ),

              SizedBox(
                height: 10.h,
              ),

              InkWell(
                onTap: () {
                  if (appController.showAdsIndex == 0 &&
                      appController.interstitialAd != null) {
                    appController.interstitialAd?.show();
                    appController.showAdsIndex = 4;
                    appController.loadAdInterstitial();
                    Get.to(estenbat_name_from_towchar_wight_search_screen());
                  } else {
                    appController.showAdsIndex--;

                    Get.to(estenbat_name_from_towchar_wight_search_screen());
                  }
                },
                child: MyCustomButton(
                    theTitle: 'اسم مشتق من جذر اوله حرفين ووزن تحبهما',
                    subTitle:
                        'أدخل الحرفين “ ه ف” والوزن استفعال لنبتكر اسم : استهفات'),
              ),

              SizedBox(
                height: 10.h,
              ),

              InkWell(
                onTap: () {
                  if (appController.showAdsIndex == 0 &&
                      appController.interstitialAd != null) {
                    appController.interstitialAd?.show();
                    appController.showAdsIndex = 4;
                    appController.loadAdInterstitial();
                    Get.to(
                        estenbat_name_from_last_towchar_root_search_screen());
                  } else {
                    appController.showAdsIndex--;

                    Get.to(
                        estenbat_name_from_last_towchar_root_search_screen());
                  }
                },
                child: MyCustomButton(
                    theTitle: 'اسم مشتق من جذر اخره حرفين  ووزن تحبهما',
                    subTitle:
                        'أدخل الحرفين “ ه ف” والوزن استفعال لنبتكر اسم : استجهاف'),
              ),
              SizedBox(
                height: 10.h,
              ),
              MyBannerAd()
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
  });

  String theTitle;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(right: 20.w, left: 20.w),
        height: 60.h,
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Color(0xFF9785EE)),
              left: BorderSide(width: 1, color: Color(0xFF9785EE)),
              bottom: BorderSide(width: 1, color: Color(0xFF9785EE)),
              right: BorderSide(width: 5.w, color: Color(0xFF9785EE)),
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.9, 0.1),
                colors: [
                  Color(0xFF7060D4),
                  Color(0xFF9785EE),
                ]),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                textAlign: TextAlign.right,
                text: theTitle,
                textColor: Colors.white,
                fontWight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ],
          ),
        ));
  }
}
