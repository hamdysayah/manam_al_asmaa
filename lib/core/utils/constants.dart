import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

const kAppName = 'منجم الاسماء';
const kPrimaryColor = 0xff9785EE;
const kScaffoldBackgroundColor = 0xffF3F3F3;
const kFontAppName = 'almaraiFont';
const kDbName = 'MangamNameDbV2.db';
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

String removeTashkel(String word) {
  word = word.replaceAll("  َ ".trim(), ""); // Fat7a
  word = word.replaceAll("  ِ ".trim(), ""); // Kasra
  word = word.replaceAll("  ُ ".trim(), ""); // damma
  word = word.replaceAll("  ّ ".trim(), ""); // Shadda
  word = word.replaceAll("  ْ ".trim(), ""); // Skoun
  word = word.replaceAll("  ٌ ".trim(), ""); // tnween_damm
  word = word.replaceAll("  ً ".trim(), ""); // tnween_fat7
  word = word.replaceAll("  ٍ ".trim(), ""); // tnween_kasr
  return word;
}

void takeScreenshot(ScreenshotController _screenshotController) async {
  await _screenshotController
      .capture(delay: const Duration(microseconds: 10))
      .then((image) async {
    if (image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = await File('${directory.path}/image.png').create();
      await imagePath.writeAsBytes(image);

      /// Share Plugin
      await Share.shareXFiles([XFile(imagePath.path)]);
    } else {
      print('object');
    }
  });
}
Future launchUrlFunc(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }


}
