import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/screens/home_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Get.to(HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_screen_search.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            Container(
                padding: EdgeInsets.only(left: 10.w),
                alignment: Alignment.center,
                child: Image.asset(
                  color: Color(kPrimaryColor),
                  'assets/images/logo_for_drawer.png',
                  scale: 0.8,
                )),
            CustomText(
              text: 'منجم الآسماء',
              fontFamily: 'BIXIE_Regular',
              fontSize: 35.sp,
              textColor: Color(kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
