import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/view/screens/estenbatNewNameSection/estenbat_name_from_name_result_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';
import '../../widgets/custom_banner.dart';

class EstenbatNameFromNameSearchScreen extends StatelessWidget {
  AppController appController = Get.find();
  String nameFromTextField = '';

  var _controller = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> theNameList = ['hamdy'];
  late TextEditingController textEditingControllerTest;

  @override
  Widget build(BuildContext context) {
    appController.isVisibleChoiceWight = false;

    return Scaffold(
        drawer: CustomDrawer(),
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_screen_search.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // الهيدر
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: 'اسم مشتق من جذر اسم معين',
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          child: Container(
                              padding: EdgeInsets.only(left: 10.w),
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                'assets/images/drawer_open_icon.png',
                                scale: 0.8,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(),
                    SizedBox(
                      height: 10.h,
                    ),

                    // باقي التصميم
                    Container(),

                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text:
                          'ابتكر اسمًا فريدًا لطفلك من خلال جذر\n اسم معين تحبه',
                      fontWight: FontWeight.bold,
                      textColor: Colors.white,
                      fontSize: 25.sp,
                    ),

                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: CustomText(
                        textColor: Colors.white60,
                        text:
                            '  أدخل اسمًا تحبه، مثل "رهف"، وسنستخرج الجذر منه (ر ه ف) وسوق نبتكر  لك اسما جديدا مشتقا منه، مثل : “مرهفة” , “مراهف”',
                        fontWight: FontWeight.bold,
                      ),
                    ),

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
                                  width: 250.w,
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
                                              fontSize: 15.sp,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                          textAlignVertical:
                                              TextAlignVertical.bottom,
                                          decoration: InputDecoration(
                                            suffixIcon: nameFromTextField
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () {
                                                      textEditingController
                                                          .clear();
                                                      nameFromTextField = '';
                                                      appController.update();
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : null,
                                            hintStyle: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white60),
                                            hintText:
                                                'ادخل الاسم بناء على المقترحات',
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xff7B7B7B),
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xff7B7B7B),
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          focusNode: focusNode,
                                        );
                                      },
                                      onSelected: (String selection) async {
                                        textEditingControllerTest.clear();
                                        nameFromTextField = '';
                                        appController.update();

                                        Get.to(
                                            EstenbatNameFromNameResultScreen(),
                                            arguments: selection);
                                      },
                                      optionsViewBuilder:
                                          (context, onSelected, options) =>
                                              Align(
                                        alignment: Alignment.topRight,
                                        child: Material(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.bottomRight,
                                                  end: Alignment.topLeft,
                                                  colors: [
                                                    Color(0xFF020202),
                                                    Color(0xFF292A2D),
                                                  ]),
                                            ),
                                            width: 250.w,
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                maxWidth: 250.w,
                                                maxHeight:
                                                    (MediaQuery.of(context)
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
                                                                      right:
                                                                          10),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: Text(
                                                                  e,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18.sp,
                                                                      fontFamily:
                                                                          'HekayaFont'),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 0.2,
                                                            color: Colors.white,
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
                              return CustomText(
                                  text: snapshot.error.toString());
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
                    SizedBox(height: 10.h,),
                    MyBannerAd()

                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
