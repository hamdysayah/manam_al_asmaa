import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';
import '../../widgets/custom_button.dart';
import 'global_name_wight_result_edittext_screen.dart';
import 'global_name_wight_result_screen.dart';

class GlobalNameWightSearchScreen extends StatelessWidget {
  AppController appController = Get.find();

  List<int> maleOrFemaleList = [1, 2];
  int currentOption = 1;

  String nameFromTextField = '';

  var _controller = TextEditingController();

  List<String> theNameList = ['hamdy'];
  late TextEditingController textEditingControllerTest;

  List<String> weightsList = [
    'اسْتِفْعَال - ( اسْتِمال)',
    'مِفْعَلَانَة - ( مِنسَمانة)',
    'مِفْعَلَان - ( مِنسَمان)',
    'مِفْعِيل - ( منصير)',
    'مُنْفَعِلَة - ( منتصرة)',
    'مُنْفَعِل - ( منتصر)',
    'مِفْعَلَة - ( مِشْكاة)',
    'مِفْعِل - ( مِذْحِج)',
    'مِفْعَل - ( مِنسَم)',
    'مِفْعَالِيّ - ( مِنْقارِيّ)',
    'مِفْعَال - ( منسام)',
    'مُفْعَال - ( مبسام)',
    'مَفْعِلَة - ( مَوْهِبة)',
    'مُفْعِلِيّ - ( مُرْشِدي)',
    'مُفْعِلَة - ( مُهيبة)',
    'مُفْعِل - ( مُريد)',
    'مُفْعَلَة - ( مُعاذَة)',
    'مُفْعَل - ( مُهاب)',
    'مُفْتَعِلَة - ( مُزْدَلِفَة)',
    'مُفْتَعِل - ( مُهْتَدي)',
    'مُفْتَعَلَة - ( مُمْتازة)',
    'مُفْتَعَل - ( مُنْتَهى)',
    'مُفَعِّلَة - ( مُوَفِّية)',
    'مُفَعَّلَة - ( مُزَنَّرة)',
    'مُفَعِّل - ( مُؤَيِّد)',
    'مُفَعَّل - ( مُيَسَّر)',
    'مُفَاعَلَة - ( مُكافَأة)',
    'مُفَاعِلَة - ( مُعاوِية)',
    'مُفَاعَل - ( مُبارَك)',
    'مَفَاعِل - ( مناسم)',
    'مُفَاعِل - ( مُهاجِر)',
    'مُسْتَفْعِل - ( مُسْتوْثق)',
    'مُتَفَعِّل - ( مُتَوَكِّل)',
    'تُفَاعِل - ( تُماضِر)',
    'مُتَفَاعِل - ( متناصر)',
    'مَفْعِل - ( مَوْئِل)',
    'مَفْعُولَة - ( مَرْضِيّة)',
    'مَفْعُولَاء - ( منسوماء)',
    'مَفْعُول - ( منصور)',
    'مَفْعَل - ( مَيْسَم)',
    'فِعليل - ( نمرير)',
    'فِعِّيلَة - ( صِدِّيقة)',
    'فِعِّيل - ( غِرِّيد)',
    'فِعْلِياء - ( نريماء)',
    'فُعْلَى - ( أُلْفَى)',
    'فِعْلَى - ( نِعْمَى)',
    'فِعْلَات - ( نِعْمات)',
    'فُعْلَت - ( أُلْفَتْ)',
    'فِعْلَت - ( نِعْمَتْ)',
    'فِعْلَة - ( حِمنة)',
    'فِعَل - ( نِعَم)',
    'فِعْل - ( هِنْد)',
    'فِعَالِيّ - ( نِساليّ)',
    'فِعَالَات - ( عِنايات)',
    'فِعَالَة - ( نِسالة)',
    'فِعَال - ( ثِمال)',
    'فُنْعُلاء - ( سنبلاء)',
    'فُعَّالَة - ( نُوَّارة)',
    'فُعَّال - ( عُنّاب)',
    'فُعَّلَة - ( سُكَّرَة)',
    'فُعْلَة - ( طُعْمة)',
    'فُعْل - ( رُشْد)',
    'فُعُولَة - ( مُروءة)',
    'فُعُول - ( بُدور)',
    'فُعَيِّل - ( كُثَيِّر)',
    'فُعَلَى - ( زُهَرَى)',
    'فُعَلاء - ( جُملاء)',
    'فُعَلَة - ( زُهَرَة)',
    'فُعَل - ( هُدى)',
    'فُعَالِيّ - ( سُباعِيّ)',
    'فُعَالَة - ( لُبانة)',
    'فِعَالَى - ( نِسالى)',
    'فُعَالَى - ( لُبانى)',
    'فُعَال - ( هُيام)',
    'فَيْعُول - ( شَيْبوب)',
    'فُوَيْعَل - ( نويسم)',
    'فَيْعَل - ( هَيْصَر)',
    'فَيْعَلَة - ( نيسمة)',
    'فَيْعَلَان - ( نيصران)',
    'فَوَاعِل - ( نَواهل)',
    'فَوْعَل - ( كَوْثَر)',
    'فَعُّولَة - ( قَدّورَة)',
    'فَعُّول - ( سَمّور)',
    'فَعَّالِيّ - ( كيّالِيّ)',
    'فَعَّالَة - ( جَبّارَة)',
    'فَعَّال - ( ورّاق)',
    'فَعْلُوت - ( نسموت)',
    'فُعْلَانَة - ( نورانة)',
    'فِعْلَاوِي - ( حِنّاوي)',
    'فَعْلَاوِي - ( غَزّاوي)',
    'فِعْلَانَة - ( وِجْدانة)',
    'فَعْلَانِيّ - ( عَدْناني)',
    'فَعْلَات - ( فَرْحات)',
    'فَعْلَانَة - ( غيسانة)',
    'فُعْلَان - ( نوران)',
    'فِعْلَان - ( وِجْدان)',
    'فَعْلَتِي - ( نَصْرَتي)',
    'فَعَلُول - ( نجمون)',
    'فَعْلَان - ( حوكان)',
    'فَعْلَت - ( نَصْرَتْ)',
    'فَعْلَى - ( نصرى)',
    'فَعَلَة - ( عَرَفَة)',
    'فَعْلَة - ( جَهْرَة)',
    'فَعْلَاء - ( سَرّاء)',
    'فَعْل - ( بَطْش)',
    'فَعِيلَات - ( عَطِيّات)',
    'فَعِيلِيّ - ( شَبيبِيّ)',
    'فَعِيلَة - ( لَميحَة)',
    'فَعِيْل - ( عَدِيّ)',
    'فَعِلَة - ( نَضِرة)',
    'فَعِل - ( رَتِل)',
    'فَعَلَاتِي - ( نجداتي)',
    'فَعَلَانَة - ( نَسَمانة)',
    'فَعَلات - ( لَمَعات)',
    'فَعَلَان - ( نَسَمان)',
    'فَعَلَى - ( نَسَمى)',
    'فَعَلَاء - ( نشَداء)',
    'فَعَل - ( نَسَم)',
    'فَعَالِيَّة - ( يَمانِيَّة)',
    'فَعَالِيَة - ( عَتاهِيَة)',
    'فَعَالِي - ( هَنادي)',
    'فَعَالَى - ( نَجامى)',
    'فَعَالَة - ( سَواحَة)',
    'فَعَالِيّ - ( يَمانِيّ)',
    'فَعَال - ( بَهار)',
    'فَاعِلاء - ( سالِماء)',
    'فَاعِيل - ( قابيل)',
    'فَاعِلِيَّة - ( هاشِمِيَّة)',
    'فَاعِلِيّ - ( ذاكِرِيّ)',
    'فَاعِلِين - ( صابرين)',
    'فَاعِلَة - ( تالِية)',
    'أَفَاعِل - ( أَكابٍر)',
    'أَفَاعِيل - ( أَغاريد)',
    'فَاعِل - ( صامِد)',
    'فَيْعَالَة - ( فَيْنانة)',
    'فَاعُولِيّ - ( ماضوني)',
    'فَاعُول - ( حاووط)',
    'فَعُولِيّ - ( نَبولى)',
    'فَعُولَة - ( نَبولة)',
    'فَعُل - ( عَضُد)',
    'فَعُول - ( كنوس)',
    'أَفْعَالَة - ( أنسمامة)',
    'أَفْعَال - ( أَزْهار)',
    'أفْعَالِيّ - ( أَنْصارِيّ)',
    'إفْعَالَة - ( إنْعامة)',
    'إفْعَال - ( إنْعام)',
    'افْتِعَالَة - ( انتجامة)',
    'افْتِعَال - ( ابْتِسال)',
    'إِفْعِلالَة - ( انجمامة)',
    'فِعْلَالَة - ( سِلْهابة)',
    'فِعْلَال - ( سِلْهاب)',
    'إِفْعِلَال - ( انجمام)',
    'انْفِعَالَة - ( انْسِجامة)',
    'انْفِعَال - ( انْسِجام)',
    'أُفْعِلَة - ( أُمْنِيَة)',
    'إِفْعِلَة - ( إنسمة)',
    'إفْعَلَة  - ( إنْعمة)',
    'أَفْعَل - ( أَسْعَد)',
    'أَفْعِلَاء - ( أسعداء)',
    'أَفْعِلَان - ( إسجمان)',
    'تَفَاعُلَة - ( تجاملة)',
    'تَفَاعِيل - ( تَرانيم)',
    'تَفَاعِل - ( تَهادي)',
    'تَفَاعُل - ( تَسامُح)',
    'تَفَعُّل - ( تَيَمُّن)',
    'تَفْعِلَات - ( تيمنات)',
    'تَفْعِلَة - ( تفرِحة)',
    'تَفْعِيلَة - ( تَوْفيقة)',
    'تِفْعَالَة - ( تِبْيانة)',
    'تَفْعِيل - ( تَيسير)',
    'تِفْعَال - ( تِبْيان)',
    'فُعَيْل - ( دُغَيم)',
    'فُعَيْلِيّ - ( عُرَيْبِيّ)',
    'فُعَيْلَاء - ( رُتَيْلاء)',
    'فِعَيْلَان - ( عِلَيَّان)',
    'فُعَيْلَان - ( حُمَيْدان)',
    'فَعَيْلَان - ( سْبيتان )',
    'فُعَيْلَى - ( زُبَيْدَى)',
    'فُعَيْلَة - ( زُبَيْدَة)',
    'فِعْلِيّ - ( فِكْرِيّ)',
    'فُعْلِيّ - ( قُدْسي)',
    'فِعْلِيَّة - ( زَهِيَّة)',
    'فُعْلِيَّة - ( يُسْرية)',
    'فَعْلِيّ - ( حَرْبي)',
    'فَعْلِيَّة - ( حَرْبِيَّة)',
    'فَعَلِيّ - ( قَمَري)',
    'فَعَلِيَّة - ( نَبَوِيَّة)',
    'فَعَائِل - ( لَطائف)',
    'فَعَايِل - ( نسايم)',
    'فَعَلِيْن - ( لمسين)',
    'فَعَلُون - ( جملون)',
    'فَعْلُول - ( شَلْهوب)',
    'فَعْلُوْنَة - ( نسمونة)',
    'فَعْلُوْن - ( نسمون)',
  ];

  @override
  Widget build(BuildContext context) {
    currentOption = maleOrFemaleList[0];
    appController.isVisibleChoiceWight = false;

    return Scaffold(
        appBar: AppBar(
          title: Text('البحث من خلال الوزن'),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                CustomText(
                  text:'ابحث عن الاسماء على وزن اسم معين',
                  fontWight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                // مربع الادخال

                FutureBuilder<List<String>>(
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
                                          textEditingValue.text.toLowerCase());
                                    });

                                    return matches;
                                  }
                                },
                                fieldViewBuilder: (BuildContext context,
                                    TextEditingController textEditingController,
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
                                    textAlignVertical: TextAlignVertical.bottom,
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
                                          fontSize: 15.sp, color: Colors.black),
                                      hintText: "أدخل الاسم",
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

                                  Get.to(GlobalNameWightResultEdittextScreen(),
                                      arguments: [selection, currentOption]);
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
                                                              color:
                                                                  Colors.white,
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
                    }),

                // الخيادات مذكر ومؤنث
                GetBuilder<AppController>(builder: (controller) {
                  return Expanded(
                    child: Column(
                      children: [
                        RadioListTile(
                          value: maleOrFemaleList[0],
                          groupValue: currentOption,
                          onChanged: (value) {
                            currentOption = value!.toInt();
                            appController.update();
                          },
                          title: Text('مذكر'),
                        ),
                        RadioListTile(
                          value: maleOrFemaleList[1],
                          groupValue: currentOption,
                          onChanged: (value) {
                            currentOption = value!.toInt();
                            appController.update();
                          },
                          title: Text('مؤنث'),
                        ),

                        SizedBox(
                          height: 10.h,
                        ),
                        // الفاصل
                        Row(children: <Widget>[
                          Expanded(child: Divider()),
                          CustomText(
                            text: "او",
                            fontSize: 20.sp,
                          ),
                          Expanded(child: Divider()),
                        ]),
                        //البحث من خلال الوزن
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: CustomText(
                            text:'ابحث عن اسماء تشترك في وزن معين من اختيارك',
                            fontWight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            customButton(
                                text: 'اختر الوزن',
                                buttonWidth: 200.w,
                                onClick: () {
                                  appController.isVisibleChoiceWight = true;
                                  appController.update();
                                }),
                            SizedBox(
                              height: 10.h,
                            ),
                            RadioListTile(
                              value: maleOrFemaleList[0],
                              groupValue: currentOption,
                              onChanged: (value) {
                                currentOption = value!.toInt();
                                appController.update();
                              },
                              title: Text('مذكر'),
                            ),
                            RadioListTile(
                              value: maleOrFemaleList[1],
                              groupValue: currentOption,
                              onChanged: (value) {
                                currentOption = value!.toInt();
                                appController.update();
                              },
                              title: Text('مؤنث'),
                            ),
                          ],
                        )),
                      ],
                    ),
                  );
                }),
              ],
            ),

            //عرض ديالوج للاوزان

            GetBuilder<AppController>(builder: (controller) {
              return Visibility(
                visible: controller.isVisibleChoiceWight,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 300.w,
                  height: 300.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(),
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              controller.isVisibleChoiceWight = false;
                              controller.update();
                            },
                            icon: const Icon(Icons.close)),
                      ),
                      CustomText(
                        text: 'اختر الوزن',
                        fontSize: 20.sp,
                        fontWight: FontWeight.bold,
                      ),
                      FutureBuilder<List<String>>(
                          future: DatabaseQueries().getWightsFromDb(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!.isNotEmpty) {
                                var theWightList = [];
                                theWightList = snapshot.data!;
                                return Expanded(
                                  child: GridView.builder(
                                    itemCount: weightsList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 2,
                                      childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .width /
                                          (MediaQuery.of(context).size.height /
                                              5),
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          appController.isVisibleChoiceWight =
                                              false;
                                          appController.update();
                                          String theWight = weightsList[index]
                                              .toString()
                                              .split('-')[0]
                                              .replaceAll(' ', '');
                                          Get.to(GlobalNameWightResultScreen(),
                                              arguments: [
                                                theWight,
                                                currentOption
                                              ]);
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.all(5),
                                            //لما يختار الوزن
                                            child: CustomText(
                                              text:
                                                  weightsList[index].toString(),
                                            )),
                                      );
                                    },
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
                          }),
                    ],
                  ),
                ),
              );
            })
          ],
        ));
  }
}
