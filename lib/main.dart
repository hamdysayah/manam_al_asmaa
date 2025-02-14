import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:manjam_asmaa/view/screens/home_screen.dart';

import 'core/utils/constants.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MangamAlAsmaaApp());
}

class MangamAlAsmaaApp extends StatelessWidget {
  const MangamAlAsmaaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: kAppName,
          locale: const Locale('ar'),
//           darkTheme:
//           ThemeData(scaffoldBackgroundColor: const Color(kBlackDarkColor)),
//           theme:
// ThemeData(scaffoldBackgroundColor: const Color(kWhiteLightColor)),
//           //themeMode: SwitchLightDarkTheme().getCurrentThemeMode(),
          home: child,
        );
      },
      child:  HomeScreen(),
    );
  }
}
