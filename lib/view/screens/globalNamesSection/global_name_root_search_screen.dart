import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:screenshot/screenshot.dart';
import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';
import '../../widgets/custom_banner.dart';
import 'global_name_root_result_nameRoot_option_screen.dart';
import 'global_name_root_result_root_option_screen.dart';

class GlobalNameRootSearchScreen extends StatelessWidget {
  AppController appController = Get.find();

  List<String> maleOrFemaleList = ['مذكر', 'مؤنث'];
  String currentOptionMaleOrFemale = 'مذكر';
  int currentOptionMaleOrFemaleIndex = 0;

  String nameFromTextField = '';

  List<String> rootOrNameOptions = ['الجذر', 'جذر اسم'];

  String currentOptionRootOrNameOptions = 'الجذر';
  int currentOptionRootOrNameOptionsIndex = 0;

  var _controller = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> theNameList = ['hamdy'];
  late TextEditingController textEditingControllerTest;

  @override
  Widget build(BuildContext context) {
    currentOptionMaleOrFemale = maleOrFemaleList[0];
    appController.isVisibleChoiceWight = false;

    return Scaffold(
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_screen_search.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
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
                              text: 'البحث في الاسماء المستخدمة',
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

                  Container(),

                  SizedBox(
                    height: 5.h,
                  ),
                  Image.asset(
                    'assets/images/root_search_icon.png',
                    color: Colors.white,
                    scale: 0.8,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    text: 'ابحث عن اسم مولودك من خلال \nالجذر اللغوي!',
                    fontWight: FontWeight.bold,
                    textColor: Colors.white,
                    fontSize: 25.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child: CustomText(
                      textColor: Colors.white60,
                      text:
                          'لديك طريقتان للبحث عن الأسماء وفق الجذر اللغوي اما جذر الفعل او جذر لاسم تختاره انت',
                      fontWight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  // مربع الادخال
                  GetBuilder<AppController>(builder: (controller) {
                    return FutureBuilder<List<String>>(
                        future: currentOptionRootOrNameOptions == 'الجذر'
                            ? DatabaseQueries()
                                .getAllRoot(currentOptionMaleOrFemale)
                            : DatabaseQueries().getNamesFromDbForRootSection(
                                currentOptionMaleOrFemale),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              theNameList = snapshot.data!;
                              return SizedBox(
                                width: 280.w,
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
                                            color: Colors.white60),
                                        textAlign: TextAlign.center,
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        decoration: InputDecoration(
                                          suffixIcon:
                                              nameFromTextField.isNotEmpty
                                                  ? InkWell(
                                                      onTap: () {
                                                        textEditingController
                                                            .clear();
                                                        nameFromTextField = '';
                                                        appController.update();
                                                      },
                                                      child: const Icon(
                                                        Icons.clear,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : null,
                                          hintStyle: const TextStyle(
                                              color: Colors.white54,
                                              fontFamily: 'ZainRegular'),
                                          hintText:
                                              " ادخل ${currentOptionRootOrNameOptions == 'الجذر' ? 'الجذر' : 'الاسم'}",
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
                                      if (currentOptionRootOrNameOptions ==
                                          'الجذر') {
                                        Get.to(
                                            GlobalNameRootResultRootOptionScreen(),
                                            arguments: [
                                              selection,
                                              currentOptionMaleOrFemale
                                            ]);
                                      } else {
                                        Get.to(
                                            GlobalNameRootResultNamerootOptionScreen(),
                                            arguments: [
                                              selection,
                                              currentOptionMaleOrFemale
                                            ]);
                                      }
                                    },
                                    optionsViewBuilder:
                                        (context, onSelected, options) => Align(
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
                                          width: 280.w,
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: 280.w,
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
                                                          height: 0.1,
                                                          color: Colors.white60,
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

                  // خيار البحث من خلال الجذر او جذر الاسم
                  GetBuilder<AppController>(builder: (controller) {
                    return Container(
                      height: 60.h,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                currentOptionRootOrNameOptions = 'الجذر';
                                currentOptionRootOrNameOptionsIndex = 0;
                                appController.update();
                              } else {
                                currentOptionRootOrNameOptions = 'جذر اسم';
                                currentOptionRootOrNameOptionsIndex = 1;
                                appController.update();
                              }
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    gradient:
                                        currentOptionRootOrNameOptionsIndex ==
                                                index
                                            ? const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment(0.9, 0.1),
                                                colors: [
                                                    Color(0xFF7060D4),
                                                    Color(0xFF9785EE),
                                                  ])
                                            : null,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                alignment: Alignment.center,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                height: 50.h,
                                child:
                                    CustomText(text: rootOrNameOptions[index])),
                          );
                        },
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                      ),
                    );
                  }),

                  // النصوص التوضحيه
                  GetBuilder<AppController>(builder: (controller) {
                    return Column(
                      children: [
                        Container(),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CustomText(
                              text: currentOptionRootOrNameOptionsIndex == 0
                                  ? 'البحث بجذر لغوي محدد'
                                  : 'البحث بأخذ جذر اسم معين',
                              textAlign: TextAlign.right,
                              fontSize: 18.sp,
                              fontWight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: CustomText(
                            text: currentOptionRootOrNameOptionsIndex == 0
                                ? ' أدخل جذرًا معينًا، مثل "علم"، وسنقترح لك أسماء مشتقة منه، مثل: “عالم” , “عليم” , “معلم”'
                                : ' أدخل اسمًا تحبه، مثل "سليم"، وسنستخرج الجذر منه (س ل م) ونقترح لك أسماء مشتقة منه، مثل : "سلام" , “سليمان” , “مسلم”',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    );
                  }),

                  SizedBox(
                    height: 10.h,
                  ),

                  // خيار مذكر او مؤنث
                  GetBuilder<AppController>(builder: (controller) {
                    return Container(
                      height: 40.h,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                currentOptionMaleOrFemale = 'مذكر';
                                currentOptionMaleOrFemaleIndex = 0;
                                appController.update();
                              } else {
                                currentOptionMaleOrFemale = 'مؤنث';
                                currentOptionMaleOrFemaleIndex = 1;
                                appController.update();
                              }
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    gradient:
                                        currentOptionMaleOrFemaleIndex == index
                                            ? const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment(0.9, 0.1),
                                                colors: [
                                                    Color(0xFF7060D4),
                                                    Color(0xFF9785EE),
                                                  ])
                                            : null,
                                    border: currentOptionMaleOrFemaleIndex !=
                                            index
                                        ? Border.all(color: Color(0xFF7060D4))
                                        : null,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 30.w),
                                width: 130.w,
                                height: 50.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CustomText(text: maleOrFemaleList[index]),
                                    Icon(
                                      index == 0 ? Icons.male : Icons.female,
                                      color: currentOptionMaleOrFemaleIndex ==
                                              index
                                          ? Colors.white
                                          : Color(0xFF7060D4),
                                    )
                                  ],
                                )),
                          );
                        },
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                      ),
                    );
                  }),

                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: MyBannerAd(),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
