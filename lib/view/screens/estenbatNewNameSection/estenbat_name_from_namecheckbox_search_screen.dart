import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/screens/estenbatNewNameSection/estenbat_name_from_name_result_screen.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';
import 'package:screenshot/screenshot.dart';
import '../../../controller/app_contrller.dart';
import '../../../core/database/database_queries.dart';
import 'estenbat_name_from_name_checkBox_result_screen.dart';

class EstenbatNameFromNameCheckBoxSearchScreen extends StatelessWidget {
  AppController appController = Get.find();

  String nameFromTextField = '';

  var _controller = TextEditingController();

  List<String> theNameList = ['hamdy'];
  late TextEditingController textEditingControllerTest;

  List<String> ListText = ['ا', 'ب', 'ب'];
  List<bool> CheckBoxbool = [false, false, false];

  String theNameChoice = '';
  String root = '';

  bool isSelected = false;

  Map<String, String> wordsMap = {
    'field8': 'اسْتِفْعَالَة',
    'field9': 'اسْتِفْعَال',
    'field10': 'مِفْعَلَانَة',
    'field11': 'مِفْعَلَان',
    'field12': 'مِفْعِيل',
    'field13': 'مُنْفَعِلَة',
    'field14': 'مُنْفَعَلَة',
    'field15': 'مُنْفَعِل',
    'field16': 'مُنْفَعَل',
    'field17': 'مِفْعَلَة',
    'field18': 'مِفْعِل',
    'field19': 'مِفْعَل',
    'field20': 'مِفْعَالَة',
    'field21': 'مِفْعَالِيّ',
    'field22': 'مُفْعَالَة',
    'field23': 'مِفْعَال',
    'field24': 'مُفْعَال',
    'field25': 'مُفْعِل',
    'field26': 'مُفْعَوَّل',
    'field27': 'مُفْعِلَّة',
    'field28': 'مُفْعَلَّة',
    'field29': 'مُفْعِلّ',
    'field30': 'مُفْعَلّ',
    'field31': 'مُفْعَّلَة',
    'field32': 'مَفْعِلَة',
    'field33': 'مُفْعِلِيّ',
    'field34': 'مُفْعِلَة',
    'field35': 'مُفْعِل',
    'field36': 'مُفْعَلَة',
    'field37': 'مُفْعَل',
    'field38': 'مُفْتَعِلَة',
    'field39': 'مُفْتَعِل',
    'field40': 'مُفْتَعَلَة',
    'field41': 'مُفْتَعَل',
    'field42': 'مُفَعِّلَة',
    'field43': 'مُفَعَّلَة',
    'field44': 'مُفَعِّل',
    'field45': 'مُفَعَّل',
    'field46': 'مُفَاعَلَة',
    'field47': 'مَفَاعِلَة',
    'field48': 'مُفَاعِلَة',
    'field49': 'مُفَاعَل',
    'field50': 'مَفَاعِل',
    'field51': 'مُفَاعِل',
    'field52': 'مُسْتَفْعِل',
    'field53': 'مُسْتَفْعَل',
    'field54': 'مُتَفَعِّل',
    'field55': 'مُتَفَعَّل',
    'field56': 'تُفَاعِل',
    'field57': 'مُتَفَاعِل',
    'field58': 'مُتَفَاعَل',
    'field59': 'مَفْعِل',
    'field60': 'مَفْعُولَة',
    'field61': 'مَفْعُولَاء',
    'field62': 'مَفْعُول',
    'field63': 'مَفْعَل',
    'field64': 'فِعليل',
    'field65': 'فِعّالة',
    'field66': 'فِعِّيلَة',
    'field67': 'فِعِّيلى',
    'field68': 'فِعِّيل',
    'field69': 'فِعْلِياء',
    'field70': 'فُعْلَى',
    'field71': 'فِعْلَى',
    'field72': 'فِعْلَات',
    'field73': 'فُعْلَت',
    'field74': 'فِعْلَت',
    'field75': 'فِعْلَة',
    'field76': 'فِعَل',
    'field77': 'فِعْل',
    'field78': 'فِعَالِيّ',
    'field79': 'فِعَالَات',
    'field80': 'فِعَالَة',
    'field81': 'فِعَلّى',
    'field82': 'فِعَال',
    'field83': 'فُنْعُلاء',
    'field84': 'فُعَّيْلَى',
    'field85': 'فُعَّلَى',
    'field86': 'فُعَّل',
    'field87': 'فُعَّالَة',
    'field88': 'فُعَّالَى',
    'field89': 'فُعَّال',
    'field90': 'فُعْلَى',
    'field91': 'فُعَّلَة',
    'field92': 'فُعْلَة',
    'field93': 'فُعْل',
    'field94': 'فُعُولَة',
    'field95': 'فُعُول',
    'field96': 'فُعُلَّى',
    'field97': 'فُعُلَّة',
    'field98': 'فُعُل',
    'field99': 'فُعَيِّل',
    'field100': 'فُعَلَى',
    'field101': 'فُعَلاء',
    'field102': 'فُعَلَة',
    'field103': 'فُعَل',
    'field104': 'فُعَالِيّ',
    'field105': 'فُعَالَة',
    'field106': 'فِعَالَى',
    'field107': 'فُعَالَى',
    'field108': 'فُعَال',
    'field109': 'فَيْعُول',
    'field110': 'فُوَيْعَل',
    'field111': 'فَيْعَل',
    'field112': 'فَيْعَلَة',
    'field113': 'فَيْعَلَان',
    'field114': 'فَوَاعِل',
    'field115': 'فَوْعَل',
    'field116': 'فَعِّيلَة',
    'field117': 'فَعِّيل',
    'field118': 'فَعُّولَة',
    'field119': 'فَعُّول',
    'field120': 'فَعَّالِيّ',
    'field121': 'فَعَّالَة',
    'field122': 'فَعَّال',
    'field123': 'فَعْلُوت',
    'field124': 'فُعْلَانَة',
    'field125': 'فِعْلَاوِي',
    'field126': 'فَعْلَاوِي',
    'field127': 'فِعْلَانَة',
    'field128': 'فَعْلَانِيّ',
    'field129': 'فَعْلَات',
    'field130': 'فَعْلَاوِي',
    'field131': 'فَعْلَانَة',
    'field132': 'فُعْلَان',
    'field133': 'فِعْلَان',
    'field134': 'فَعْلَتِي',
    'field135': 'فَعَلُول',
    'field136': 'فَعْلَان',
    'field137': 'فَعْلَت',
    'field138': 'فَعْلَى',
    'field139': 'فَعَلَة',
    'field140': 'فَعْلَة',
    'field141': 'فَعْلَاء',
    'field142': 'فَعْل',
    'field143': 'فَعِيلَات',
    'field144': 'فَعِيلِيّ',
    'field145': 'فَعِيلَة',
    'field146': 'فَعِيل',
    'field147': 'فَعِلَة',
    'field148': 'فَعِل',
    'field149': 'فَعَلَاتِي',
    'field150': 'فَعَلَانَة',
    'field151': 'فَعَلات',
    'field152': 'فَعَلَان',
    'field153': 'فَعَلَى',
    'field154': 'فَعَلَاء',
    'field155': 'فَعَل',
    'field156': 'فَعَالِيَّة',
    'field157': 'فَعَالِيَة',
    'field158': 'فَعَالِي',
    'field159': 'فَعَالَى',
    'field160': 'فَعَالَة',
    'field161': 'فَعَالِيّ',
    'field162': 'فَعَال',
    'field163': 'فَاعِلاء',
    'field164': 'فَاعِيل',
    'field165': 'فَاعِلِيَّة',
    'field166': 'فَاعِلِيّ',
    'field167': 'فَاعِلِين',
    'field168': 'فَاعِلَة',
    'field169': 'أَفَاعِل',
    'field170': 'أَفَاعِيل',
    'field171': 'فَاعِل',
    'field172': 'فَيْعَالَة',
    'field173': 'فَيْعُولِ',
    'field174': 'فَاعُولِيّ',
    'field175': 'فَاعُول',
    'field176': 'فَعُولِيّ',
    'field177': 'فَعُولَة',
    'field178': 'فَعُل',
    'field179': 'فَعُول',
    'field180': 'أَفْعَالَة',
    'field181': 'أَفْعَال',
    'field182': 'أفْعَالِيّ',
    'field183': 'إفْعَالَة',
    'field184': 'إفْعَال',
    'field185': 'اسْتِفَعْلَة',
    'field186': 'افْتِعَالَة',
    'field187': 'افْتِعَال',
    'field188': 'إِفْعِلالَة',
    'field189': 'فِعْلَالَة',
    'field190': 'فِعْلَال',
    'field191': 'إِفْعِلَال',
    'field192': 'انْفِعَالَة',
    'field193': 'انْفِعَال',
    'field194': 'أُفْعِلَة',
    'field195': 'إِفْعِلَة',
    'field196': 'إفْعَلَة',
    'field197': 'أَفْعَل',
    'field198': 'أَفْعِلَاء',
    'field199': 'أَفْعِلَان',
    'field200': 'تَفَاعُلَة',
    'field201': 'تَفَاعِيل',
    'field202': 'تَفَاعِل',
    'field203': 'تَفَاعُل',
    'field204': 'تَفَعُّلَة',
    'field205': 'تَفَعُّل',
    'field206': 'تَفْعِلَات',
    'field207': 'تَفْعِلَة',
    'field208': 'تَفْعِيلَة',
    'field209': 'تِفْعَالَة',
    'field210': 'تَفْعِيل',
    'field211': 'تِفْعَال',
    'field212': 'تِفِعّال',
    'field213': 'فُعَيْل',
    'field214': 'فُعَيْلِيّ',
    'field215': 'فُعَيْلَاء',
    'field216': 'فِعَيْلَان',
    'field217': 'فُعَيْلَان',
    'field218': 'فْعَيْلَان',
    'field219': 'فُعَيْلَى',
    'field220': 'فُعَيْلَة',
    'field221': 'فِعْلِيّ',
    'field222': 'فُعْلِيّ',
    'field223': 'فِعْلِيَّة',
    'field224': 'فُعْلِيَّة',
    'field225': 'فَعْلِيّ',
    'field226': 'فَعْلِيَّة',
    'field227': 'فَعَلِيّ',
    'field228': 'فَعَلِيَّة',
    'field229': 'فَعَايِل',
    'field230': 'فَعَايِل',
    'field231': 'فَعَلِيْن',
    'field232': 'فَعَلُون',
    'field233': 'فَعْلُول',
    'field234': 'فَعْلُوْنَة',
    'field235': 'فَعْلُوْن',
  };

  String theColumnName = '';

  @override
  Widget build(BuildContext context) {
    appController.isVisibleChoiceWight = false;

    return Scaffold(
        appBar: AppBar(
          title: Text('البحث من خلال الجذر'),
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
                                    theNameChoice = selection;
                                    nameFromTextField = '';
                                    isSelected = true;
                                    root = await DatabaseQueries()
                                        .getRootForName(selection);
                                    ListText[0] = '${root[0]}';
                                    ListText[1] = '${root[1]}';
                                    ListText[2] = '${root[2]}';
                                    String wight = await DatabaseQueries()
                                        .getWightFromName(selection);
                                    wight = removeTashkel(wight);
                                    for (int x = 8; x < 235; x++) {
                                      if (wight ==
                                          removeTashkel(wordsMap['field$x']!)) {
                                        theColumnName = 'field$x';
                                        print('the $theColumnName');
                                      }
                                    }

                                    appController.update();

                                    Get.to(
                                        EstenbatNameFromNameCheckboxResultScreen(),arguments:[ ListText[0], ListText[1]]);


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
                })
              ],
            ),
          ],
        ));
  }
}
