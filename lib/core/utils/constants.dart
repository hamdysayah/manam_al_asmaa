import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

const kAppName = 'منجم الاسماء';
const kPrimaryColor = 0xff324d6b;
const kPrimaryColorDark = 0xff1c1b1f;
const kScaffoldBackgroundColor = 0xffF3F3F3;
const kFontAppName = 'almaraiFont';
const kDbName = 'MangamNameDbV1.db';
const kBlackDarkColor = 0xFF292925;
const kWhiteLightColor = 0xfff4f9fc;

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}

Future launchUrlFunc(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
