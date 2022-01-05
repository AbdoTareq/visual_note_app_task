import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visual_note_app_task/controller/forget_pass_controller.dart';

import '../../export.dart';

class ForgetPassPage extends StatelessWidget {
  ForgetPassPage({Key? key}) : super(key: key);
  final controller = Get.put(ForgetPassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            40.heightBox,
            Image.asset('$baseImagePath/logo.png').centered(),
            60.heightBox,
            'Forget Password'.text.black.bold.make().p2().wFull(context),
            20.heightBox,
            TextInput(
              borderColor: Colors.black,
              controller: controller.passTextController,
              hint: 'Password',
              validate: (value) =>
                  GetUtils.isGreaterThan(value!.length, 8) ? 'pass is right' : 'pass is wrong',
            ),
            TextInput(
              controller: controller.confirmTextController,
              borderColor: Colors.black,
              hint: 'Confirm Password',
              validate: (value) => GetUtils.isEmail(value!) ? 'mail is right' : 'mail is wrong',
            ),
            20.heightBox,
            RoundedCornerButton(
              onPressed: () => controller.resetPass(),
              color: Colors.black,
              child: 'Reset Password'.text.white.bold.xl.make().p8(),
            ).wFull(context),
            20.heightBox,
          ],
        ).pSymmetric(h: 24),
      ),
    ));
  }
}
