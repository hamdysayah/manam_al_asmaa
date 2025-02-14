import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/app_contrller.dart';
import '../widgets/custom_button.dart';
import 'global_name_char_result_screen.dart';

class GlobalNameCharSearchScreen extends StatelessWidget {
  AppController appController = Get.find();

  List<int> typeOfSearch = [1, 2, 3];
  int currentOption = 1;

  String nameFromTextField = '';
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    currentOption = typeOfSearch[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('منجم الاسماء'),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          SizedBox(
            height: 100.h,
          ),
          GetBuilder<AppController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: _controller,
                  style: TextStyle(
                    fontSize: 17.sp,
                    //    color: appController.isDark ? Colors.white : Colors.black,
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    nameFromTextField = value;
                    _controller.clear();
                    controller.update();
                    Get.to(GlobalCharNameResultScreen(),
                     arguments: [currentOption, nameFromTextField]);
                  },
                  autofocus: true,
                  onChanged: (value) {
                    nameFromTextField = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'ابحث هنا...',
                      hintStyle: TextStyle(
                          //     color: appController.isDark ? Colors.white : Colors.black,
                          )),
                ),
              ),
            );
            // الخيارات
          }),
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
                  customButton(
                      text: 'بحث',
                      buttonWidth: 200.w,
                      onClick: () {
                        _controller.clear();
                        appController.update();
                        Get.to(GlobalCharNameResultScreen(),
                            arguments: [currentOption, nameFromTextField]);
                      })
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
