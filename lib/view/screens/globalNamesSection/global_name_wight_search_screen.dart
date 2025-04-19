import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';
import '../../widgets/custom_banner.dart';
import '../../widgets/custom_button.dart';
import 'global_name_wight_result_edittext_screen.dart';
import 'global_name_wight_result_screen.dart';

class GlobalNameWightSearchScreen extends StatelessWidget {
  AppController appController = Get.find();
  var scaffoldKey = GlobalKey<ScaffoldState>();

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
    appController.isVisibleChoiceWight = false;

    return Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
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

                    // باقي التصميم
                    Container(),

                    SizedBox(
                      height: 5.h,
                    ),
                    Image.asset(
                      'assets/images/wight_search_icon.png',
                      color: Colors.white,
                      scale: 0.8,
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text:
                          'اختر اسم مولودك بناءً على الوزن \nالصرفي الذي تفضله!',
                      fontWight: FontWeight.bold,
                      textColor: Colors.white,
                      fontSize: 25.sp,
                    ),

                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: CustomText(
                        textColor: Colors.white60,
                        text: 'لديك طريقتان للبحث عن الأسماء وفق الوزن الصرفي',
                        fontWight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5.w),
                      alignment: Alignment.topRight,
                      child: CustomText(
                        text: 'البحث بأخذ وزن اسم معين',
                        fontWight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(right: 5.w),
                      alignment: Alignment.topRight,
                      child: CustomText(
                        textAlign: TextAlign.right,
                        text:
                            ' أدخل اسمًا تحبه، مثل "أحمد"، وسنقترح لك أسماء تحمل نفس الوزن، مثل:  “أبسل” , “أبيض” , “أبان”',
                        fontWight: FontWeight.bold,
                        textColor: Colors.white60,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    // خيارات مذكر ومؤنث
                    GetBuilder<AppController>(builder: (controller) {
                      return Container(
                        height: 40.h,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (index == 0) {
                                  currentOption = 1;
                                  appController.update();
                                } else {
                                  currentOption = 2;
                                  appController.update();
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      gradient: currentOption - 1 == index
                                          ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment(0.9, 0.1),
                                              colors: [
                                                  Color(0xFF7060D4),
                                                  Color(0xFF9785EE),
                                                ])
                                          : null,
                                      border: currentOption - 1 != index
                                          ? Border.all(color: Color(0xFF7060D4))
                                          : null,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 30.w),
                                  width: 130.w,
                                  height: 50.h,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      CustomText(
                                          text: maleOrFemaleList[index] == 1
                                              ? 'مذكر'
                                              : 'مؤنث'),
                                      Icon(
                                        index == 0 ? Icons.male : Icons.female,
                                        color: currentOption - 1 == index
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

                    // مربع الادخال
                    FutureBuilder<List<String>>(
                        future: DatabaseQueries().getNamesFromDb(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              theNameList = snapshot.data!;
                              return Container(
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
                                                      child: Icon(
                                                        Icons.clear,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : null,
                                          hintStyle: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white54,
                                          ),
                                          hintText: "أدخل الاسم الذي تحبه",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xff7B7B7B),
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              // width: 0.0 produces a thin "hairline" border
                                              borderSide: BorderSide(
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
                                          GlobalNameWightResultEdittextScreen(),
                                          arguments: [
                                            selection,
                                            currentOption
                                          ]);
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
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              child: Text(
                                                                e,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'HekayaFont',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      17.sp,
                                                                ),
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

                    SizedBox(
                      height: 10.h,
                    ),

                    GetBuilder<AppController>(builder: (controller) {
                      return Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            // الفاصل
                            Row(children: <Widget>[
                              Expanded(child: Divider()),
                              SizedBox(
                                width: 5.w,
                              ),
                              CustomText(
                                text: "او",
                                fontSize: 25.sp,
                                textColor: Color(kPrimaryColor),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(child: Divider()),
                              SizedBox(
                                width: 5.w,
                              ),
                            ]),
                            //البحث من خلال الوزن
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: CustomText(
                                text:
                                    'ابحث عن اسماء تشترك في وزن معين من اختيارك',
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

                                // اختيار مذكر او مؤنث
                                GetBuilder<AppController>(
                                    builder: (controller) {
                                  return Container(
                                    height: 40.h,
                                    alignment: Alignment.center,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            if (index == 0) {
                                              currentOption = 1;
                                              appController.update();
                                            } else {
                                              currentOption = 2;
                                              appController.update();
                                            }
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  gradient: currentOption - 1 ==
                                                          index
                                                      ? LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment(
                                                              0.9, 0.1),
                                                          colors: [
                                                              Color(0xFF7060D4),
                                                              Color(0xFF9785EE),
                                                            ])
                                                      : null,
                                                  border: currentOption - 1 !=
                                                          index
                                                      ? Border.all(
                                                          color:
                                                              Color(0xFF7060D4))
                                                      : null,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              alignment: Alignment.center,
                                              margin:
                                                  EdgeInsets.only(right: 30.w),
                                              width: 130.w,
                                              height: 50.h,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  CustomText(
                                                      text: maleOrFemaleList[
                                                                  index] ==
                                                              1
                                                          ? 'مذكر'
                                                          : 'مؤنث'),
                                                  Icon(
                                                    index == 0
                                                        ? Icons.male
                                                        : Icons.female,
                                                    color: currentOption - 1 ==
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

                                InkWell(
                                  onTap: () {
                                    appController.isVisibleChoiceWight = true;
                                    appController.update();
                                  },
                                  child: Container(
                                    width: 300.w,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment(0.9, 0.1),
                                          colors: [
                                            Color(0xFF7060D4),
                                            Color(0xFF9785EE),
                                          ]),
                                    ),
                                    child:
                                        CustomText(text: 'اختر الوزن الصرفي'),
                                  ),
                                ),

                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            )),
                          ],
                        ),
                      );
                    }),
                    Container(
                      child: MyBannerAd(),
                    )
                  ],
                ),
              ),

///////////////////////////////////////////////////////////////////////////////////////

              //عرض ديالوج للاوزان
              GetBuilder<AppController>(builder: (controller) {
                return Visibility(
                  visible: controller.isVisibleChoiceWight,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/background_screen_search.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 350.w,
                    height: 500.h,
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
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
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
                                        mainAxisSpacing: 1,
                                        childAspectRatio:
                                            MediaQuery.of(context).size.width /
                                                (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    4),
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
                                            Get.to(
                                                GlobalNameWightResultScreen(),
                                                arguments: [
                                                  theWight,
                                                  currentOption
                                                ]);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.white60),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomRight,
                                                    end: Alignment.topLeft,
                                                    colors: [
                                                      Color(0xFF020202),
                                                      Color(0xFF292A2D),
                                                    ]),
                                              ),
                                              padding: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.all(5),
                                              //لما يختار الوزن
                                              child: CustomText(
                                                fontSize: 20.sp,
                                                text: weightsList[index]
                                                    .toString(),
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
                                    CustomText(text: '....جاري التحميل '),
                                  ],
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ));
  }
}
