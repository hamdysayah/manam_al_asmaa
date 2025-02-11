import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/app_contrller.dart';

class GlobalNameSearchScreen extends StatelessWidget {
  AppController appController = Get.put(AppController());

  List<int> typeOfSearch = [1, 2, 3, 4, 5, 6, 7, 8];
  int currentOption = 1;

  @override
  Widget build(BuildContext context) {
    currentOption = typeOfSearch[0];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                style: TextStyle(
                  fontSize: 17.sp,
                  //    color: appController.isDark ? Colors.white : Colors.black,
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  // setState(() {
                  //   searchWordText = value;
                  //   availableSearch = true;
                  // });
                },
                autofocus: true,
                onChanged: (value) {},
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'ابحث هنا...',
                    hintStyle: TextStyle(
                        //     color: appController.isDark ? Colors.white : Colors.black,
                        )),
              ),
            ),
          ),
          // الخيارات

          GetBuilder<AppController>(builder: (controller) {
            return Expanded(
              child: Column(
                children: [
                  RadioListTile(
                    value: typeOfSearch[0],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('اسماء تبدا ب.. '),
                  ),
                  RadioListTile(
                    value: typeOfSearch[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('اسماء تنتهي ب..'),
                  ),
                  RadioListTile(
                    value: typeOfSearch[2],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('اسماء تحتوي على ..'),
                  ),
                  RadioListTile(
                    value: typeOfSearch[3],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('حسب الموضوع'),
                  ),
                  RadioListTile(
                    value: typeOfSearch[4],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('أسماء تشترك في جذر معين '),
                  ),
                  RadioListTile(
                    value: typeOfSearch[5],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('أسماء تشترك في جذر اسم معين '),
                  ),
                  RadioListTile(
                    value: typeOfSearch[6],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('أسماء على وزن اسم معين'),
                  ),
                  RadioListTile(
                    value: typeOfSearch[7],
                    groupValue: currentOption,
                    onChanged: (value) {
                      currentOption = value!.toInt();
                      appController.update();
                    },
                    title: Text('أسماء على وزن معين '),
                  ),
                ],
              ),
            );
          }),
          // customButton(text: 'بحث', buttonWidth: 200.w, onClick: () {})
        ],
      ),
    );
  }
}
