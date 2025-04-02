import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/view/screens/estenbatNewNameSection/estenbat_name_from_name_result_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';

class EstenbatNameFromNameSearchScreen extends StatelessWidget {
  AppController appController = Get.find();

  String nameFromTextField = '';

  var _controller = TextEditingController();

  List<String> theNameList = ['hamdy'];
  late TextEditingController textEditingControllerTest;

  @override
  Widget build(BuildContext context) {
    appController.isVisibleChoiceWight = false;

    return Scaffold(
        appBar: AppBar(
          title: Text('اشتقاق من خلال جذر اسم معين'),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                SizedBox(
                  height: 10.h,
                ),
                // مربع الادخال
                GetBuilder<AppController>(builder: (controller) {
                  return FutureBuilder<List<String>>(
                      future: DatabaseQueries().getNamesFromDb(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isNotEmpty) {
                            theNameList = snapshot.data!;
                            return SizedBox(
                              width: 210.w,
                              height: 40.h,
                              child: GetBuilder<AppController>(
                                builder: (controller) => Autocomplete(
                                  optionsBuilder:
                                      (TextEditingValue textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    } else {
                                      List<String> matches = <String>[];
                                      matches.addAll(
                                          theNameList as Iterable<String>);
                                      matches.retainWhere((s) {
                                        return s.toLowerCase().contains(
                                            textEditingValue.text
                                                .toLowerCase());
                                      });

                                      return matches;
                                    }
                                  },
                                  fieldViewBuilder: (BuildContext context,
                                      TextEditingController
                                          textEditingController,
                                      FocusNode focusNode,
                                      VoidCallback onFieldSubmitted) {
                                    textEditingControllerTest =
                                        textEditingController;
                                    return TextField(
                                      cursorColor: const Color(0xFF292925),
                                      autofocus: false,
                                      controller: textEditingController,
                                      onTapOutside: (event) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      onChanged: (value) {
                                        nameFromTextField = value;
                                        appController.update();
                                      },
                                      style: TextStyle(
                                          fontSize: 15.sp, color: Colors.black),
                                      textAlign: TextAlign.center,
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      decoration: InputDecoration(
                                        suffixIcon: nameFromTextField.isNotEmpty
                                            ? InkWell(
                                                onTap: () {
                                                  textEditingController.clear();
                                                  nameFromTextField = '';
                                                  appController.update();
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Colors.black,
                                                ),
                                              )
                                            : null,
                                        hintStyle: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.black),
                                        hintText: 'ادخل الاسم',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      focusNode: focusNode,
                                    );
                                  },
                                  onSelected: (String selection) async {
                                    textEditingControllerTest.clear();
                                    nameFromTextField = '';
                                    appController.update();

                                    Get.to(EstenbatNameFromNameResultScreen(),
                                        arguments: selection);
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) => Align(
                                    alignment: Alignment.topRight,
                                    child: Material(
                                      child: Container(
                                        color: Colors.blue,
                                        width: 210.w,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: 210.w,
                                            maxHeight: (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    2) -
                                                (MediaQuery.of(context)
                                                        .viewInsets
                                                        .bottom /
                                                    3),
                                          ),
                                          child: ListView(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            children: options
                                                .map(
                                                  (e) => Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () =>
                                                            onSelected(e),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 5,
                                                                  bottom: 5,
                                                                  right: 10),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Text(
                                                              e,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 17.sp,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 0.1,
                                                        color: Colors.black,
                                                      )
                                                    ],
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return CustomText(text: 'لا يوجد نتائج');
                          }
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
              ],
            ),
          ],
        ));
  }
}
