import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';
import '../../widgets/custom_button.dart';
import 'estenbat_name_from_name_checkBox_result_screen.dart';

class EstenbatNameFromNameCheckBoxSearchScreen extends StatelessWidget {
  AppController appController = Get.find();

  String nameFromTextField = '';
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var _controller = TextEditingController();

  List<String> theNameList = ['hamdy'];
  late TextEditingController textEditingControllerTest;

  List<String> ListText = ['ا', 'ب', 'ب'];
  List<bool> CheckBoxbool = [false, false, false];

  String theNameChoice = '';
  String root = '';

  bool isSelected = false;
  Map<String, String> wordsMap = {
    'field8': 'اسْتِفْعَال',
    'field9': 'مِفْعَلَانَة',
    'field10': 'مِفْعَلَان',
    'field11': 'مِفْعِيل',
    'field12': 'مُنْفَعِلَة',
    'field13': 'مُنْفَعِل',
    'field14': 'مِفْعَلَة',
    'field15': 'مِفْعِل',
    'field16': 'مِفْعَل',
    'field17': 'مِفْعَالِيّ',
    'field18': 'مِفْعَال',
    'field19': 'مُفْعَال',
    'field20': 'مَفْعِلَة',
    'field21': 'مُفْعِلِيّ',
    'field22': 'مُفْعِلَة',
    'field23': 'مُفْعِل',
    'field24': 'مُفْعَلَة',
    'field25': 'مُفْعَل',
    'field26': 'مُفْتَعِلَة',
    'field27': 'مُفْتَعِل',
    'field28': 'مُفْتَعَلَة',
    'field29': 'مُفْتَعَل',
    'field30': 'مُفَعِّلَة',
    'field31': 'مُفَعَّلَة',
    'field32': 'مُفَعِّل',
    'field33': 'مُفَعَّل',
    'field34': 'مُفَاعَلَة',
    'field35': 'مُفَاعِلَة',
    'field36': 'مُفَاعَل',
    'field37': 'مَفَاعِل',
    'field38': 'مُفَاعِل',
    'field39': 'مُسْتَفْعِل',
    'field40': 'مُتَفَعِّل',
    'field41': 'تُفَاعِل',
    'field42': 'مُتَفَاعِل',
    'field43': 'مَفْعِل',
    'field44': 'مَفْعُولَة',
    'field45': 'مَفْعُولَاء',
    'field46': 'مَفْعُول',
    'field47': 'مَفْعَل',
    'field48': 'فِعليل',
    'field49': 'فِعِّيلَة',
    'field50': 'فِعِّيل',
    'field51': 'فِعْلِياء',
    'field52': 'فُعْلَى',
    'field53': 'فِعْلَى',
    'field54': 'فِعْلَات',
    'field55': 'فُعْلَت',
    'field56': 'فِعْلَت',
    'field57': 'فِعْلَة',
    'field58': 'فِعَل',
    'field59': 'فِعْل',
    'field60': 'فِعَالِيّ',
    'field61': 'فِعَالَات',
    'field62': 'فِعَالَة',
    'field63': 'فِعَال',
    'field64': 'فُنْعُلاء',
    'field65': 'فُعَّالَة',
    'field66': 'فُعَّال',
    'field67': 'فُعَّلَة',
    'field68': 'فُعْلَة',
    'field69': 'فُعْل',
    'field70': 'فُعُولَة',
    'field71': 'فُعُول',
    'field72': 'فُعَيِّل',
    'field73': 'فُعَلَى',
    'field74': 'فُعَلاء',
    'field75': 'فُعَلَة',
    'field76': 'فُعَل',
    'field77': 'فُعَالِيّ',
    'field78': 'فُعَالَة',
    'field79': 'فِعَالَى',
    'field80': 'فُعَالَى',
    'field81': 'فُعَال',
    'field82': 'فَيْعُول',
    'field83': 'فُوَيْعَل',
    'field84': 'فَيْعَل',
    'field85': 'فَيْعَلَة',
    'field86': 'فَيْعَلَان',
    'field87': 'فَوَاعِل',
    'field88': 'فَوْعَل',
    'field89': 'فَعُّولَة',
    'field90': 'فَعُّول',
    'field91': 'فَعَّالِيّ',
    'field92': 'فَعَّالَة',
    'field93': 'فَعَّال',
    'field94': 'فَعْلُوت',
    'field95': 'فُعْلَانَة',
    'field96': 'فِعْلَاوِي',
    'field97': 'فَعْلَاوِي',
    'field98': 'فِعْلَانَة',
    'field99': 'فَعْلَانِيّ',
    'field100': 'فَعْلَات',
    'field101': 'فَعْلَانَة',
    'field102': 'فُعْلَان',
    'field103': 'فِعْلَان',
    'field104': 'فَعْلَتِي',
    'field105': 'فَعَلُول',
    'field106': 'فَعْلَان',
    'field107': 'فَعْلَت',
    'field108': 'فَعْلَى',
    'field109': 'فَعَلَة',
    'field110': 'فَعْلَة',
    'field111': 'فَعْلَاء',
    'field112': 'فَعْل',
    'field113': 'فَعِيلَات',
    'field114': 'فَعِيلِيّ',
    'field115': 'فَعِيلَة',
    'field116': 'فَعِيْل',
    'field117': 'فَعِلَة',
    'field118': 'فَعِل',
    'field119': 'فَعَلَاتِي',
    'field120': 'فَعَلَانَة',
    'field121': 'فَعَلات',
    'field122': 'فَعَلَان',
    'field123': 'فَعَلَى',
    'field124': 'فَعَلَاء',
    'field125': 'فَعَل',
    'field126': 'فَعَالِيَّة',
    'field127': 'فَعَالِيَة',
    'field128': 'فَعَالِي',
    'field129': 'فَعَالَى',
    'field130': 'فَعَالَة',
    'field131': 'فَعَالِيّ',
    'field132': 'فَعَال',
    'field133': 'فَاعِلاء',
    'field134': 'فَاعِيل',
    'field135': 'فَاعِلِيَّة',
    'field136': 'فَاعِلِيّ',
    'field137': 'فَاعِلِين',
    'field138': 'فَاعِلَة',
    'field139': 'أَفَاعِل',
    'field140': 'أَفَاعِيل',
    'field141': 'فَاعِل',
    'field142': 'فَيْعَالَة',
    'field143': 'فَاعُولِيّ',
    'field144': 'فَاعُول',
    'field145': 'فَعُولِيّ',
    'field146': 'فَعُولَة',
    'field147': 'فَعُل',
    'field148': 'فَعُول',
    'field149': 'أَفْعَالَة',
    'field150': 'أَفْعَال',
    'field151': 'أفْعَالِيّ',
    'field152': 'إفْعَالَة',
    'field153': 'إفْعَال',
    'field154': 'افْتِعَالَة',
    'field155': 'افْتِعَال',
    'field156': 'إِفْعِلالَة',
    'field157': 'فِعْلَالَة',
    'field158': 'فِعْلَال',
    'field159': 'إِفْعِلَال',
    'field160': 'انْفِعَالَة',
    'field161': 'انْفِعَال',
    'field162': 'أُفْعِلَة',
    'field163': 'إِفْعِلَة',
    'field164': 'إفْعَلَة',
    'field165': 'أَفْعَل',
    'field166': 'أَفْعِلَاء',
    'field167': 'أَفْعِلَان',
    'field168': 'تَفَاعُلَة',
    'field169': 'تَفَاعِيل',
    'field170': 'تَفَاعِل',
    'field171': 'تَفَاعُل',
    'field172': 'تَفَعُّل',
    'field173': 'تَفْعِلَات',
    'field174': 'تَفْعِلَة',
    'field175': 'تَفْعِيلَة',
    'field176': 'تِفْعَالَة',
    'field177': 'تَفْعِيل',
    'field178': 'تِفْعَال',
    'field179': 'فُعَيْل',
    'field180': 'فُعَيْلِيّ',
    'field181': 'فُعَيْلَاء',
    'field182': 'فِعَيْلَان',
    'field183': 'فُعَيْلَان',
    'field184': 'فَعَيْلَان',
    'field185': 'فُعَيْلَى',
    'field186': 'فُعَيْلَة',
    'field187': 'فِعْلِيّ',
    'field188': 'فُعْلِيّ',
    'field189': 'فِعْلِيَّة',
    'field190': 'فُعْلِيَّة',
    'field191': 'فَعْلِيّ',
    'field192': 'فَعْلِيَّة',
    'field193': 'فَعَلِيّ',
    'field194': 'فَعَلِيَّة',
    'field195': 'فَعَائِل',
    'field196': 'فَعَايِل',
    'field197': 'فَعَلْين',
    'field198': 'فَعَلُون',
    'field199': 'فَعْلُول',
    'field200': 'فَعْلُوْنَة',
    'field201': 'فَعْلُوْن',
  };
  Map<String, String> wordsMapsTashkel = {};

  Map<String, String> nameTashkelMap = {
    '': '',
  };
  String theColumnName = '';

  @override
  Widget build(BuildContext context) {
    appController.isVisibleChoiceWight = false;

    return Scaffold(
        drawer: const CustomDrawer(),
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
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
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
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          text: 'ابتكر اسم جديد من جذور لغتنا العربية',
                          textColor: Colors.white,
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
                    CustomText(
                      text: 'ابتكر اسمًا فريدًا لطفلك من جذر\n اسم معين تحبه',
                      fontWight: FontWeight.bold,
                      textColor: Colors.white,
                      fontSize: 25.sp,
                    ),

                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: CustomText(
                        fontSize: 15.sp,
                        textColor: Colors.white60,
                        text:
                            ' أدخل اسمًا تحبه، مثل "رهف"، وسنستخرج الجذر منه (ر ه ف) وسوق نبتكر  لك اسما جديدا مشتقا منه، مثل : “مرهفة” , “مراهف”',
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
                                            hintText: 'ادخل الاسم الذي تحبه',
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
                                        isSelected = true;

                                        if (await DatabaseQueries()
                                            .checkNoFoundMoreName(selection)) {
                                          theNameChoice = selection;

                                          root = await DatabaseQueries()
                                              .getRootForName(selection);
                                          ListText[0] = '${root[0]}';
                                          ListText[1] = '${root[1]}';
                                          ListText[2] = '${root[2]}';
                                          String wight = await DatabaseQueries()
                                              .getWightFromName(selection);
                                          for (int x = 8;
                                              x < wordsMap.length - 1;
                                              x++) {
                                            if (wight == wordsMap['field$x']!) {
                                              theColumnName = 'field$x';
                                            }
                                          }
                                          appController.update();
                                        } else {
                                          List<String> names =
                                              await DatabaseQueries()
                                                  .getNameWithTashkel(
                                                      selection);
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("اختر الكلمه"),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    customButton(
                                                        text: names[0],
                                                        buttonWidth: 100.w,
                                                        onClick: () async {
                                                          theNameChoice =
                                                              names[0];

                                                          root = await DatabaseQueries()
                                                              .getRootForTashkelName(
                                                                  names[0]);
                                                          ListText[0] =
                                                              '${root[0]}';
                                                          ListText[1] =
                                                              '${root[1]}';
                                                          ListText[2] =
                                                              '${root[2]}';
                                                          String wight =
                                                              await DatabaseQueries()
                                                                  .getWightFromTashkelName(
                                                                      names[0]);
                                                          for (int x = 8;
                                                              x <
                                                                  wordsMap.length -
                                                                      1;
                                                              x++) {
                                                            if (wight ==
                                                                wordsMap[
                                                                    'field$x']!) {
                                                              theColumnName =
                                                                  'field$x';
                                                            }
                                                          }
                                                          appController
                                                              .update();
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                    customButton(
                                                        text: names[1],
                                                        buttonWidth: 100.w,
                                                        onClick: () async {
                                                          theNameChoice =
                                                              names[1];

                                                          root = await DatabaseQueries()
                                                              .getRootForTashkelName(
                                                                  names[1]);
                                                          ListText[0] =
                                                              '${root[0]}';
                                                          ListText[1] =
                                                              '${root[1]}';
                                                          ListText[2] =
                                                              '${root[2]}';
                                                          String wight =
                                                              await DatabaseQueries()
                                                                  .getWightFromTashkelName(
                                                                      names[1]);
                                                          for (int x = 8;
                                                              x <
                                                                  wordsMap.length -
                                                                      1;
                                                              x++) {
                                                            if (wight ==
                                                                wordsMap[
                                                                    'field$x']!) {
                                                              theColumnName =
                                                                  'field$x';
                                                            }
                                                          }
                                                          appController
                                                              .update();
                                                          Navigator.pop(
                                                              context);
                                                        })
                                                  ],
                                                ),
                                                actions: [],
                                              );
                                            },
                                          );
                                        }
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
                                            width: 210.w,
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                maxWidth: 210.w,
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
                                  CustomText(text: '....جاري التحميل '),
                                ],
                              );
                            }
                          });
                    }),
                    SizedBox(
                      height: 10.h,
                    ),
                    // الاسم الذي اختاره
                    GetBuilder<AppController>(builder: (controller) {
                      return CustomText(
                        text: theNameChoice,
                        fontWight: FontWeight.bold,
                        fontSize: 20.sp,
                      );
                    }),
                    GetBuilder<AppController>(builder: (controller) {
                      return isSelected
                          ? CustomText(
                              text:
                                  'اختر حرفين من الجذر ($root )لتحصل  على اسماء مثل وزن الاسم (${theNameChoice})',
                              fontWight: FontWeight.bold)
                          : SizedBox.shrink();
                    }),

                    //    checkbox خيارات
                    GetBuilder<AppController>(builder: (controller) {
                      return isSelected
                          ? Row(
                              children: [
                                Expanded(
                                  child: ListTileTheme(
                                    horizontalTitleGap: 0,
                                    child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: CheckBoxbool[0],
                                      onChanged: (value) {
                                        CheckBoxbool[0] = value!;
                                        appController.update();
                                      },
                                      title: CustomText(text: ListText[0]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTileTheme(
                                    horizontalTitleGap: 0,
                                    child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: CheckBoxbool[1],
                                      onChanged: (value) {
                                        CheckBoxbool[1] = value!;

                                        appController.update();
                                      },
                                      title: CustomText(text: ListText[1]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTileTheme(
                                    horizontalTitleGap: 0,
                                    child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: CheckBoxbool[2],
                                      onChanged: (value) {
                                        CheckBoxbool[2] = value!;

                                        appController.update();
                                      },
                                      title: CustomText(text: ListText[2]),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : SizedBox.shrink();
                    }),
                    GetBuilder<AppController>(builder: (controller) {
                      return isSelected
                          ? Padding(
                              padding: EdgeInsets.only(top: 10.h, left: 10.w),
                              child: Container(
                                width: 80.w,
                                height: 50.h,
                                child: customButton(
                                    text: 'بحث',
                                    buttonWidth: 100.w,
                                    onClick: () {
                                      if (CheckBoxbool[0] == true &&
                                          CheckBoxbool[1] == true &&
                                          CheckBoxbool[2] == true) {
                                        showToast('يجب اختيار حرفين فقط');
                                      } else if (CheckBoxbool[0] == true &&
                                          CheckBoxbool[1] == true) {
                                        Get.to(
                                            EstenbatNameFromNameCheckboxResultScreen(),
                                            arguments: [
                                              ListText[0],
                                              ListText[1],
                                              theColumnName,
                                              [0, 1],
                                              theNameChoice
                                            ]);
                                      } else if (CheckBoxbool[0] == true &&
                                          CheckBoxbool[2] == true) {
                                        Get.to(
                                            EstenbatNameFromNameCheckboxResultScreen(),
                                            arguments: [
                                              ListText[0],
                                              ListText[2],
                                              theColumnName,
                                              [0, 2],
                                              theNameChoice
                                            ]);
                                      } else if (CheckBoxbool[1] == true &&
                                          CheckBoxbool[2] == true) {
                                        Get.to(
                                            EstenbatNameFromNameCheckboxResultScreen(),
                                            arguments: [
                                              ListText[1],
                                              ListText[2],
                                              theColumnName,
                                              [1, 2],
                                              theNameChoice
                                            ]);
                                      } else {
                                        showToast('الرجاء اختيار حرفين');
                                      }
                                    }),
                              ),
                            )
                          : SizedBox.shrink();
                    })
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
