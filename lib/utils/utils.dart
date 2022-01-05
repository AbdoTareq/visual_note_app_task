import 'package:flutter/material.dart';
import 'package:get/get.dart';

// methods
showWarningDialog({String title = '', String text = ''}) {
  Get.defaultDialog(
    title: title.isNotEmpty ? title.tr : 'watch'.tr,
    middleText: text.isNotEmpty ? text.tr : 'under_dev'.tr,
    titleStyle: TextStyle(color: Colors.red),
  );
}

showOptionsDialog({String title = '', String text = '', required Function() yesFunction}) {
  Get.defaultDialog(
      title: title.isNotEmpty ? title.tr : 'watch'.tr,
      middleText: text.isNotEmpty ? text.tr : 'under_dev'.tr,
      titleStyle: TextStyle(color: Colors.red),
      actions: [
        FlatButton(
          onPressed: yesFunction,
          child: Text(
            'yes'.tr,
            style: TextStyle(color: Colors.red),
          ),
        ),
        FlatButton(
          onPressed: () => Get.back(),
          child: Text(
            'cancel'.tr,
          ),
        ),
      ]);
}

showSimpleDialog({String title = '', String text = ''}) {
  Get.defaultDialog(
    title: title.isNotEmpty ? title.tr : '👍',
    middleText: text.isNotEmpty ? text.tr : 'under_dev'.tr,
  );
}

showSuccessSnack({String title = '', String text = ''}) {
  Get.snackbar(title.isNotEmpty ? title.tr : '👍'.tr, text.isNotEmpty ? text.tr : 'under_dev'.tr,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      barBlur: 10,
      margin: EdgeInsets.all(10),
      backgroundColor: Colors.green,
      padding: EdgeInsets.all(8));
}

showFailSnack({String title = '', String text = ''}) {
  Get.snackbar(title.isNotEmpty ? title.tr : '👎'.tr, text.isNotEmpty ? text.tr : 'under_dev'.tr,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 6),
      barBlur: 10,
      margin: EdgeInsets.all(10),
      backgroundColor: Colors.red,
      padding: EdgeInsets.all(8));
}

 String replaceArabicNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(arabic[i], english[i]);
  }
  return input;
}
