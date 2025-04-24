import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/controller/app_contrller.dart';
import 'package:manjam_asmaa/core/utils/constants.dart';
import 'package:manjam_asmaa/view/widgets/custom_button.dart';
import 'package:manjam_asmaa/view/widgets/custom_drawer.dart';

import '../../../core/database/database_queries.dart';
import '../../widgets/custom_banner.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import 'estenbat_name_from_last_towchar_root_result_screen.dart';
import 'estenbat_name_from_root_result_screen.dart';
import 'estenbat_name_from_towchar_wight_result_screen.dart';

class estenbat_name_from_last_towchar_root_search_screen
    extends StatelessWidget {
  String char1 = '', char2 = '';

  TextEditingController textEditingController1 = TextEditingController(),
      textEditingController2 = TextEditingController();

  AppController appController = Get.find();


  List<String> weightsList = [
    'اسْتِفْعَال - ( اسْتِمال)',
    'افْتِعَال - ( ابْتِسال)',
    'افْتِعَالَة - ( انتجامة)',
    'انْفِعَال - ( انْسِجام)',
    'انْفِعَالَة - ( انْسِجامة)',
    'إفْعَال - ( إنْعام)',
    'إفْعَالَة - ( إنْعامة)',
    'إِفْعِلَال - ( انجمام)',
    'إِفْعِلالَة - ( انجمامة)',
    'إِفْعِلَة - ( إنسمة)',
    'إفْعَلَة  - ( إنْعمة)',
    'أَفَاعِل - ( أَكابٍر)',
    'أَفَاعِيل - ( أَغاريد)',
    'أَفْعَال - ( أَزْهار)',
    'أَفْعَالَة - ( أنسمامة)',
    'أفْعَالِيّ - ( أَنْصارِيّ)',
    'أَفْعَل - ( أَسْعَد)',
    'أَفْعِلَاء - ( أسعداء)',
    'أَفْعِلَان - ( إسجمان)',
    'أُفْعِلَة - ( أُمْنِيَة)',
    'تُفَاعِل - ( تُماضِر)',
    'تَفَاعِل - ( تَهادي)',
    'تَفَاعُل - ( تَسامُح)',
    'تَفَاعُلَة - ( تجاملة)',
    'تَفَاعِيل - ( تَرانيم)',
    'تِفْعَال - ( تِبْيان)',
    'تِفْعَالَة - ( تِبْيانة)',
    'تَفَعُّل - ( تَيَمُّن)',
    'تَفْعِلَات - ( تيمنات)',
    'تَفْعِلَة - ( تفرِحة)',
    'تَفْعِيل - ( تَيسير)',
    'تَفْعِيلَة - ( تَوْفيقة)',
    'فَاعِل - ( صامِد)',
    'فَاعِلاء - ( سالِماء)',
    'فَاعِلَة - ( تالِية)',
    'فَاعِلِيّ - ( ذاكِرِيّ)',
    'فَاعِلِيَّة - ( هاشِمِيَّة)',
    'فَاعِلِين - ( صابرين)',
    'فَاعُول - ( حاووط)',
    'فَاعُولِيّ - ( ماضوني)',
    'فَاعِيل - ( قابيل)',
    'فِعَال - ( ثِمال)',
    'فُعَّال - ( عُنّاب)',
    'فُعَال - ( هُيام)',
    'فَعَّال - ( ورّاق)',
    'فَعَال - ( بَهار)',
    'فِعَالَات - ( عِنايات)',
    'فِعَالَة - ( نِسالة)',
    'فُعَّالَة - ( نُوَّارة)',
    'فُعَالَة - ( لُبانة)',
    'فَعَّالَة - ( جَبّارَة)',
    'فَعَالَة - ( سَواحَة)',
    'فِعَالَى - ( نِسالى)',
    'فُعَالَى - ( لُبانى)',
    'فَعَالَى - ( نَجامى)',
    'فِعَالِيّ - ( نِساليّ)',
    'فُعَالِيّ - ( سُباعِيّ)',
    'فَعَّالِيّ - ( كيّالِيّ)',
    'فَعَالِي - ( هَنادي)',
    'فَعَالِيّ - ( يَمانِيّ)',
    'فَعَالِيَّة - ( يَمانِيَّة)',
    'فَعَالِيَة - ( عَتاهِيَة)',
    'فَعَايِل - ( نسايم)',
    'فَعَائِل - ( لَطائف)',
    'فِعَل - ( نِعَم)',
    'فِعْل - ( هِنْد)',
    'فُعْل - ( رُشْد)',
    'فُعَل - ( هُدى)',
    'فَعْل - ( بَطْش)',
    'فَعِل - ( رَتِل)',
    'فَعَل - ( نَسَم)',
    'فَعُل - ( عَضُد)',
    'فُعَلاء - ( جُملاء)',
    'فَعْلَاء - ( سَرّاء)',
    'فَعَلَاء - ( نشَداء)',
    'فِعْلَات - ( نِعْمات)',
    'فَعْلَات - ( فَرْحات)',
    'فَعَلات - ( لَمَعات)',
    'فَعَلَاتِي - ( نجداتي)',
    'فِعْلَال - ( سِلْهاب)',
    'فِعْلَالَة - ( سِلْهابة)',
    'فُعْلَان - ( نوران)',
    'فِعْلَان - ( وِجْدان)',
    'فَعْلَان - ( حوكان)',
    'فَعَلَان - ( نَسَمان)',
    'فُعْلَانَة - ( نورانة)',
    'فِعْلَانَة - ( وِجْدانة)',
    'فَعْلَانَة - ( غيسانة)',
    'فَعَلَانَة - ( نَسَمانة)',
    'فَعْلَانِيّ - ( عَدْناني)',
    'فِعْلَاوِي - ( حِنّاوي)',
    'فَعْلَاوِي - ( غَزّاوي)',
    'فِعْلَة - ( حِمنة)',
    'فُعَّلَة - ( سُكَّرَة)',
    'فُعْلَة - ( طُعْمة)',
    'فُعَلَة - ( زُهَرَة)',
    'فَعَلَة - ( عَرَفَة)',
    'فَعْلَة - ( جَهْرَة)',
    'فَعِلَة - ( نَضِرة)',
    'فُعْلَت - ( أُلْفَتْ)',
    'فِعْلَت - ( نِعْمَتْ)',
    'فَعْلَت - ( نَصْرَتْ)',
    'فَعْلَتِي - ( نَصْرَتي)',
    'فَعْلُوت - ( نسموت)',
    'فَعَلُول - ( نجمون)',
    'فَعْلُول - ( شَلْهوب)',
    'فَعَلُون - ( جملون)',
    'فَعْلُوْن - ( نسمون)',
    'فَعْلُوْنَة - ( نسمونة)',
    'فُعْلَى - ( أُلْفَى)',
    'فِعْلَى - ( نِعْمَى)',
    'فُعَلَى - ( زُهَرَى)',
    'فَعْلَى - ( نصرى)',
    'فَعَلَى - ( نَسَمى)',
    'فِعْلِيّ - ( فِكْرِيّ)',
    'فُعْلِيّ - ( قُدْسي)',
    'فَعْلِيّ - ( حَرْبي)',
    'فَعَلِيّ - ( قَمَري)',
    'فِعْلِياء - ( نريماء)',
    'فِعْلِيَّة - ( زَهِيَّة)',
    'فُعْلِيَّة - ( يُسْرية)',
    'فَعْلِيَّة - ( حَرْبِيَّة)',
    'فَعَلِيَّة - ( نَبَوِيَّة)',
    'فِعليل - ( نمرير)',
    'فَعَلِيْن - ( لمسين)',
    'فُعُول - ( بُدور)',
    'فَعُّول - ( سَمّور)',
    'فَعُول - ( كنوس)',
    'فُعُولَة - ( مُروءة)',
    'فَعُّولَة - ( قَدّورَة)',
    'فَعُولَة - ( نَبولة)',
    'فَعُولِيّ - ( نَبولى)',
    'فِعِّيل - ( غِرِّيد)',
    'فُعَيِّل - ( كُثَيِّر)',
    'فَعِيْل - ( عَدِيّ)',
    'فُعَيْل - ( دُغَيم)',
    'فُعَيْلَاء - ( رُتَيْلاء)',
    'فَعِيلَات - ( عَطِيّات)',
    'فِعَيْلَان - ( عِلَيَّان)',
    'فُعَيْلَان - ( حُمَيْدان)',
    'فَعَيْلَان - ( سْبيتان )',
    'فِعِّيلَة - ( صِدِّيقة)',
    'فَعِيلَة - ( لَميحَة)',
    'فُعَيْلَة - ( زُبَيْدَة)',
    'فُعَيْلَى - ( زُبَيْدَى)',
    'فَعِيلِيّ - ( شَبيبِيّ)',
    'فُعَيْلِيّ - ( عُرَيْبِيّ)',
    'فُنْعُلاء - ( سنبلاء)',
    'فَوَاعِل - ( نَواهل)',
    'فَوْعَل - ( كَوْثَر)',
    'فُوَيْعَل - ( نويسم)',
    'فَيْعَالَة - ( فَيْنانة)',
    'فَيْعَل - ( هَيْصَر)',
    'فَيْعَلَان - ( نيصران)',
    'فَيْعَلَة - ( نيسمة)',
    'فَيْعُول - ( شَيْبوب)',
    'مُتَفَاعِل - ( متناصر)',
    'مُتَفَعِّل - ( مُتَوَكِّل)',
    'مُسْتَفْعِل - ( مُسْتوْثق)',
    'مُفَاعَل - ( مُبارَك)',
    'مَفَاعِل - ( مناسم)',
    'مُفَاعِل - ( مُهاجِر)',
    'مُفَاعَلَة - ( مُكافَأة)',
    'مُفَاعِلَة - ( مُعاوِية)',
    'مُفْتَعِل - ( مُهْتَدي)',
    'مُفْتَعَل - ( مُنْتَهى)',
    'مُفْتَعِلَة - ( مُزْدَلِفَة)',
    'مُفْتَعَلَة - ( مُمْتازة)',
    'مِفْعَال - ( منسام)',
    'مُفْعَال - ( مبسام)',
    'مِفْعَالِيّ - ( مِنْقارِيّ)',
    'مِفْعِل - ( مِذْحِج)',
    'مِفْعَل - ( مِنسَم)',
    'مُفْعِل - ( مُريد)',
    'مُفْعَل - ( مُهاب)',
    'مُفَعِّل - ( مُؤَيِّد)',
    'مُفَعَّل - ( مُيَسَّر)',
    'مَفْعِل - ( مَوْئِل)',
    'مَفْعَل - ( مَيْسَم)',
    'مِفْعَلَان - ( مِنسَمان)',
    'مِفْعَلَانَة - ( مِنسَمانة)',
    'مِفْعَلَة - ( مِشْكاة)',
    'مَفْعِلَة - ( مَوْهِبة)',
    'مُفْعِلَة - ( مُهيبة)',
    'مُفْعَلَة - ( مُعاذَة)',
    'مُفَعِّلَة - ( مُوَفِّية)',
    'مُفَعَّلَة - ( مُزَنَّرة)',
    'مُفْعِلِيّ - ( مُرْشِدي)',
    'مَفْعُول - ( منصور)',
    'مَفْعُولَاء - ( منسوماء)',
    'مَفْعُولَة - ( مَرْضِيّة)',
    'مِفْعِيل - ( منصير)',
    'مُنْفَعِل - ( منتصر)',
    'مُنْفَعِلَة - ( منتصرة)',
  ];

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

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const CustomDrawer(),
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
          child: Column(
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
                          text: 'اسم مشتق من جذر معين',
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
              Padding(
                padding: EdgeInsets.all(5),
                child: CustomText(
                  text:
                      'ابتكر اسمًا فريدًا لطفلك بجذر ينتهي بحرفين ويتبع وزنًا معينًا!',
                  fontWight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: CustomText(
                  textColor: Colors.white60,
                  text:
                      ' أدخل الحرفين "م ر" واختر الوزن الصرفي “مُفتَعِل” سنبتكر لك اسماء مثل : “مُجتمِر” , “مُستثمِر” , “مُنعمِر”',
                  fontWight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  GetBuilder<AppController>(builder: (controller) {
                    return Expanded(
                        child: CustomTextField(
                      textEditingController: textEditingController1,
                      hintText: 'الحرف الثاني',
                      showSuffixIcon: appController.showSuffixText6,
                      suffixIconClick: () {
                        textEditingController1.clear();
                        char1 = '';
                        appController.showSuffixText6 = false;
                        appController.update();
                      },
                      onChanged: (value) {
                        char1 = value;
                        value.isNotEmpty
                            ? appController.showSuffixText6 = true
                            : appController.showSuffixText6 = false;

                        appController.update();
                      },
                    ));
                  }),
                  SizedBox(
                    width: 10.w,
                  ),
                  GetBuilder<AppController>(builder: (contoller) {
                    return Expanded(
                      child: Expanded(
                          child: CustomTextField(
                        textEditingController: textEditingController2,
                        hintText: 'الحرف الثالث',
                        suffixIconClick: () {
                          textEditingController2.clear();
                          char2 = '';
                          appController.showSuffixText7 = false;
                          appController.update();
                        },
                        showSuffixIcon: appController.showSuffixText7,
                        onChanged: (value) {
                          char2 = value;
                          value.isNotEmpty
                              ? appController.showSuffixText7 = true
                              : appController.showSuffixText7 = false;
                          FocusScope.of(context).unfocus();
                          appController.update();
                        },
                      )),
                    );
                  }),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: weightsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 5),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        String theColumnName = '';
                        for (int x = 0; x < weightsList.length - 1; x++) {
                          if (weightsList[index]
                                  .toString()
                                  .split('-')[0]
                                  .replaceAll(' ', '') ==
                              wordsMap['field${x + 8}']!) {
                            theColumnName = 'field${x + 8}';
                          }
                        }
                        if (char1 == '' || char2 == '') {
                          showToast('الرجاء ادخال الاحرف');
                        } else {
                          Get.to(EstenbatNameFromLastTowcharRootResultScreen(),
                              arguments: [
                                char1,
                                char2,
                                theColumnName,
                                weightsList[index]
                                    .toString()
                                    .split('-')[0]
                                    .replaceAll(' ', '')
                              ]);
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white60),
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xFF020202),
                                  Color(0xFF292A2D),
                                ]),
                          ),
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(5),
                          child: CustomText(
                            text: weightsList[index],
                          )),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              MyBannerAd()
            ],
          ),
        ),
      ),
    );
  }
}
