import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';

import '../../controller/app_contrller.dart';
import '../../core/database/database_queries.dart';
import '../../medel/namesModel.dart';

Widget NameDetailsDialog(String selectedName) {
  return Visibility(
      visible: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                border: Border.all(width: 1)),
            width: 300.w,
            //  height: 300.h,
            child: GetBuilder<AppController>(builder: (controller) {
              return FutureBuilder<Namesmodel>(
                  future: DatabaseQueries().getNameDetails(selectedName),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.close)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10.h,
                                ),
                                CustomText(
                                    text: 'الاسم : ${snapshot.data!.name}'),
                                SizedBox(
                                  width: 50.h,
                                ),
                                CustomText(
                                    text:
                                        'النوع : ${snapshot.data!.typeOfName}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10.h,
                                ),
                                CustomText(
                                    text: 'الوزن  : ${snapshot.data!.nameWight}'),
                                SizedBox(
                                  width: 50.h,
                                ),
                                CustomText(
                                    text: ' المجال : ${snapshot.data!.domainName}'),

                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(text: 'الجذر : ${snapshot.data!.root}'),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                                text: 'الاصل : ${snapshot.data!.origin}'),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                                text: 'المعنى : ${snapshot.data!.meaning}'),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return CustomText(text: snapshot.error.toString());
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(),
                          const CircularProgressIndicator(),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomText(text: '....جاري التحميل ')
                        ],
                      );
                    }
                  });
            }),
          ),
        ],
      ));
}
