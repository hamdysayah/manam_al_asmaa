import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  bool isVisibleNameDetailsDialog = false;
  bool isVisibleChoiceWight = false;
  bool showSuffixText1 = false;
  bool showSuffixText2 = false;
  bool showSuffixText3 = false;
  bool showSuffixText4 = false;
  bool showSuffixText5 = false;
  bool showSuffixText6 = false;
  bool showSuffixText7 = false;



  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
  @override
  void onInit() {
    super.onInit();
  }



}
