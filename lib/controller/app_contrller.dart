import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../core/utils/constants.dart';

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

  int showAdsIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  InterstitialAd? interstitialAd;

  void loadAdInterstitial() {
    interstitialAd = null;
    final adUnitIdInterstitial =
        Platform.isAndroid ? kInterstitialAdsAndroid : kInterstitialAdsIos;
    InterstitialAd.load(
        adUnitId: adUnitIdInterstitial,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            update();
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  // Dispose the ad here to free resources.
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {},
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});
          },
          onAdFailedToLoad: (LoadAdError error) {},
        ));
  }

  @override
  void onInit() {
    super.onInit();
  }
}
