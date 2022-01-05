import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  TextEditingController passTextController = TextEditingController();
  TextEditingController confirmTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> resetPass() async {
    if (formKey.currentState!.validate()) {}
  }

  Future<void> signWithGoogle() async {}
  Future<void> signWithApple() async {}
  Future<void> signWithFacebook() async {}

  @override
  void dispose() {
    super.dispose();
    confirmTextController.dispose();
  }
}
