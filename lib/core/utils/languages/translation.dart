import 'package:get/get.dart';
import 'ar.dart';
import 'en.dart';
import 'fr.dart';
import 'ind.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'ar': ar, 'en': en, 'fr': fr, 'id': ind};
}
