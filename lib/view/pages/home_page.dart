import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visual_note_app_task/controller/home_controller.dart';
import 'package:visual_note_app_task/view/widgets/app_drawer.dart';
import 'package:visual_note_app_task/view/widgets/custom_app_bar.dart';
import 'package:visual_note_app_task/view/widgets/text_input.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final ImagePicker _picker = ImagePicker();
  // Pick an image

  var image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Note App',
        ),
        drawer: const AppDrawer(),
        body: SafeArea(
          child: ListView(
            children: [
              60.heightBox,
              TextInput(
                controller: controller.textControllers[0],
                hint: 'Title',
              ),
              TextInput(
                controller: controller.textControllers[1],
                hint: 'Description',
              ),
              Obx(
                () => CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('isOpen'.tr),
                  value: controller.isOpen.value,
                  onChanged: (value) => controller.isOpen.toggle(),
                ),
              ),
              MaterialButton(
                  color: Colors.blue,
                  onPressed: () async {
                    // Pick an image
                    controller.image.value = await _picker.pickImage(source: ImageSource.gallery);
                  },
                  splashColor: Colors.blueGrey,
                  child: 'Pick image'.text.bold.xl.make().p8()),
              Obx(() => controller.image.value!.path.isEmpty
                  ? Container()
                  : Image.file(File(controller.image.value!.path)))
            ],
          ).p16(),
        ));
  }
}
