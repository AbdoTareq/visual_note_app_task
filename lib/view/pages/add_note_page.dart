import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visual_note_app_task/constants.dart';
import 'package:visual_note_app_task/controller/note_controller.dart';
import 'package:visual_note_app_task/models/note.dart';
import 'package:visual_note_app_task/view/widgets/app_drawer.dart';
import 'package:visual_note_app_task/view/widgets/custom_app_bar.dart';
import 'package:visual_note_app_task/view/widgets/text_input.dart';
import 'package:velocity_x/velocity_x.dart';

// Page to create or update note
class AddNotePage extends GetView<NoteController> {
  AddNotePage(this.note, {Key? key}) : super(key: key);

  final Note? note;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    if (note != null) {
      controller.setFieldsToIfUpdateNote(note!);
    }
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Note App',
        ),
        drawer: const AppDrawer(),
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                60.heightBox,
                'Add Note:'.text.bold.xl2.color(kPrimaryColor).xl.make().p8(),
                20.heightBox,
                TextInput(
                  controller: controller.textControllers[0],
                  hint: 'Title',
                  validate: (value) => value!.isEmpty ? 'Eenter some text' : null,
                ),
                TextInput(
                  controller: controller.textControllers[1],
                  hint: 'Description',
                  validate: (value) => value!.isEmpty ? 'Eenter some text' : null,
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
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        color: kPrimaryColor,
                        onPressed: () async {
                          controller.image.value = await _picker.pickImage(source: ImageSource.camera);
                        },
                        splashColor: Colors.blueGrey,
                        child: 'Pick image'.text.bold.xl.make().p8()),
                    Obx(() => controller.image.value!.path.isEmpty
                        ? Container()
                        : Image.file(File(controller.image.value!.path)).wh10(context)),
                    MaterialButton(
                        color: kPrimaryColor,
                        onPressed: () async {
                          controller.selectedDate(await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now()));
                        },
                        splashColor: Colors.blueGrey,
                        child: Obx(
                          () => (controller.selectedDate.value.year == 1960
                                  ? 'Pick a date'
                                  : controller.selectedDate.string.substring(0, 10))
                              .text
                              .bold
                              .xl
                              .make()
                              .p8(),
                        )),
                  ],
                ),
                20.heightBox,
                MaterialButton(
                    color: kPrimaryColor,
                    onPressed: () async => await controller.saveNote(id: note != null ? note!.id : null),
                    splashColor: Colors.blueGrey,
                    child: 'Save'.text.bold.xl.make().p8()),
              ],
            ).p16(),
          ),
        ));
  }
}
