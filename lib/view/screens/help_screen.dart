import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manjam_asmaa/view/widgets/custom_text.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_screen_search.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // الهيدر
              SizedBox(
                height: 10.h,
              ),
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
                      text: 'المساعدة',
                      textColor: Colors.white,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SectionTitle(title: 'كيفية البحث والاشتقاق'),
              SubSectionTitle(title: 'البحث حسب جذر الاسم'),
              SectionText(
                text:
                    'يمكن البحث عن الأسماء العربية وفقًا لجذرها اللغوي. تجذر الأسماء في اللغة العربية يعود إلى ثلاثة، '
                    'يمكن من خلالها تشكيل العديد من الكلمات والأسماء. للبحث عن اسم محدد بناءً على الجذر، '
                    'عليك إدخال جذر الاسم في خانة البحث، وسيقوم التطبيق بعرض جميع الأسماء التي تحتوي على هذا الجذر.',
              ),
              SubSectionTitle(title: 'البحث حسب وزن الاسم'),
              SectionText(
                text:
                    'تأتي الأسماء العربية بأوزان مختلفة تتبع أنماطًا معينة، مثل وزن "فعل" أو "فعيل". '
                    'للبحث عن الأسماء وفق الوزن، يمكنك إدخال الوزن المطلوب في خانة البحث، وسيعرض التطبيق كافة الأسماء التي تتبع هذا الوزن.',
              ),
              SubSectionTitle(title: 'البحث حسب الموضوع'),
              SectionText(
                text:
                    'يمكنك أيضًا البحث عن الأسماء بناءً على الموضوع أو المعنى العام للاسم. سواء كنت تبحث عن أسماء تحمل معنى النصر، '
                    'أو أسماء ترتبط بالزهر والنباتات، يمكنك إدخال الموضوع في خانة البحث ليعرض لك التطبيق جميع الأسماء المرتبطة بهذا الموضوع.',
              ),
              SubSectionTitle(
                  title: 'البحث حسب الحروف التي يبدأ وينتهي بها الاسم'),
              SectionText(
                text:
                    'للبحث عن الأسماء حسب الحروف الأولى أو الأخيرة، يمكنك إدخال الحرف أو الحروف في خانة البحث. '
                    'على سبيل المثال، إذا كنت تبحث عن أسماء تبدأ بحرف "م"، فقط ادخل هذا الحرف وسيعرض لك التطبيق قائمة بالأسماء التي تبدأ بحرف "م".',
              ),
              SectionTitle(title: 'كيفية اشتقاق أسماء جديدة'),
              SubSectionTitle(title: 'اشتقاق أسماء جديدة حسب الوزن'),
              SectionText(
                text:
                    'إذا كنت ترغب في اشتقاق أسماء جديدة تتبع وزنًا معينًا، يمكنك إدخال الوزن المطلوب في خانة الاشتقاق. '
                    'سيقوم التطبيق بتوليد أسماء جديدة تتبع هذا الوزن بناءً على الجذور المتاحة في قواعد البيانات.',
              ),
              SubSectionTitle(title: 'اشتقاق أسماء جديدة حسب الجذر'),
              SectionText(
                text:
                    'لاشتقاق أسماء جديدة بناءً على جذر معين، يمكنك إدخال الجذر المطلوب وسيقوم التطبيق بتوليد أسماء جديدة تتبع هذا الجذر. '
                    'هذا يتيح لك الحصول على أسماء متصلة بأصل لغوي محدد.',
              ),
              SubSectionTitle(title: 'اشتقاق أسماء جديدة حسب وزن اسم معين'),
              SectionText(
                text:
                    'إذا كنت ترغب في اشتقاق أسماء جديدة تتبع وزن اسم موجود بالفعل، يمكنك إدخال الاسم في خانة الاشتقاق. '
                    'سيقوم التطبيق بتحليل الوزن اللغوي لهذا الاسم وتوليد أسماء جديدة تتبع نفس الوزن.',
              ),
              SubSectionTitle(title: 'اشتقاق أسماء جديدة حسب جذر اسم معين'),
              SectionText(
                text:
                    'للاشتقاق بناءً على جذر اسم موجود، يمكنك إدخال الاسم وسيقوم التطبيق بتحليل الجذر وتوليد أسماء جديدة تتبع نفس الجذر اللغوي.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
        textAlign: TextAlign.right,
      ),
    );
  }
}

class SubSectionTitle extends StatelessWidget {
  final String title;

  const SubSectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4),
      child: CustomText(
        text: title,
        textColor: Colors.white,
        fontSize: 21.sp,
        textAlign: TextAlign.right,
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;

  const SectionText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      textAlign: TextAlign.right,
    );
  }
}
