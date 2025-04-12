import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      await Share.shareXFiles(
          subject: 'منجم الآسماء',
          text:
              'ابحث واكتشف  المزيد في منجم  الاسماء حمل التطبيق من الرابط التالي : https://play.google.com/store/apps/details?id=com.almaany.manjam_asmaa ',
          [XFile(imagePath.path)]);
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

Future<void> addOrUpdateName(String name) async {
  final namesCollection = FirebaseFirestore.instance.collection('names');

  // ابحث عن الاسم (تطابق تام)
  final query =
      await namesCollection.where('theName', isEqualTo: name).limit(1).get();

  if (query.docs.isNotEmpty) {
    // الاسم موجود → حدث اللايك
    final docId = query.docs.first.id;
    await namesCollection.doc(docId).update({
      'likes': FieldValue.increment(1),
    });
    print('تم تحديث اللايك للاسم "$name"');
  } else {
    // الاسم غير موجود → أضفه جديد
    await namesCollection.add({
      'name': name,
      'likes': 1,
    });
    print('تم إضافة الاسم "$name" مع أول لايك');
  }
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addOrUpdateLike(String name) async {
  final collection = _firestore.collection('names');

  try {
    final querySnapshot =
        await collection.where('theName', isEqualTo: name).get();

    if (querySnapshot.docs.isNotEmpty) {
      // الاسم موجود: نحدث عدد اللايكات
      final doc = querySnapshot.docs.first;
      final currentLikes = doc['likes'] ?? 0;
      await collection.doc(doc.id).update({'likes': currentLikes + 1});
    } else {
      // الاسم مش موجود: نضيف وثيقة جديدة
      await collection.add({
        'theName': name,
        'likes': 1,
      });
    }
    showToast('شكرا لك');
  } catch (e) {
    print('حصل خطأ: $e');
  }
}
