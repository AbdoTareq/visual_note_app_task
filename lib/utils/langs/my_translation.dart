import 'ar.dart';
import 'en.dart';
import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_EG': ar,
        'en_US': en,
      };
}
