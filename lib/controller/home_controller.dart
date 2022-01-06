import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visual_note_app_task/models/note.dart';
import 'package:visual_note_app_task/repos/note_repo.dart';

import '../constants.dart';

class HomeController extends GetxController {
  final NoteRepository repository;
  HomeController(this.repository);
  Rx<XFile?> image = XFile('').obs;
  final selectedDate = DateTime(1960).obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  RxBool isOpen = false.obs;

  List<TextEditingController> textControllers = List.generate(2, (index) => TextEditingController());

  Future<void> saveNote() async {
    if (formKey.currentState!.validate()) {
      // var note = Note(
      //     title: textControllers[0].text,
      //     description: textControllers[1].text,
      //     dateInMiliSeconds: selectedDate.string,
      //     image: image.value!.path,
      //     isOpen: isOpen.value ? 1 : 0);
      // logger.i("${(await repository.insert(note)).toMap()}");
    }
  }
}
