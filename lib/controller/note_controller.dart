import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:visual_note_app_task/models/note.dart';
import 'package:visual_note_app_task/repos/note_repo.dart';
import 'package:visual_note_app_task/utils/utils.dart';

import '../constants.dart';

// controll notes to manipulate notes
class NoteController extends GetxController {
  final NoteRepository repository;
  NoteController(this.repository);

  Rx<XFile?> image = XFile('').obs;
  final selectedDate = DateTime(1960).obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  RxBool isOpen = false.obs;
  List<TextEditingController> textControllers = List.generate(2, (index) => TextEditingController());

  final notes = <Note>[].obs;

  @override
  void onReady() async {
    await getAll();
    super.onReady();
  }

  setFieldsToIfUpdateNote(Note note) {
    textControllers[0].text = note.title;
    textControllers[1].text = note.description;
    isOpen(note.isOpen == 1);
    try {
      selectedDate(DateTime(
        int.parse(note.dateInMiliSeconds.substring(0, 4)),
        int.parse(note.dateInMiliSeconds.substring(5, 7)),
        int.parse(note.dateInMiliSeconds.substring(8, 10)),
      ));
    } catch (e) {
      logger.i("$e");
    }
    image(XFile(note.image));
  }

  Future getAll() async => notes(await repository.getAll());

  Future delete(int id) async => await repository.delete(id);

  Future<void> saveNote({int? id}) async {
    if (formKey.currentState!.validate()) {
      if (selectedDate.value.year == 1960) {
        return showWarningDialog(text: 'Pick a date');
      }
      if (image.value!.path.isEmpty) {
        return showWarningDialog(text: 'Pick an image');
      }
      var note = id == null
          ? Note(
              title: textControllers[0].text,
              description: textControllers[1].text,
              dateInMiliSeconds: selectedDate.string,
              image: image.value!.path,
              isOpen: isOpen.value ? 1 : 0)
          : Note(
              id: id,
              title: textControllers[0].text,
              description: textControllers[1].text,
              dateInMiliSeconds: selectedDate.string,
              image: image.value!.path,
              isOpen: isOpen.value ? 1 : 0);
      id == null ? (await repository.insert(note)).toMap() : (await repository.update(note));
      logger.i("$id");
      await getAll();
      clearFields();
      Get.back();
    }
  }

  clearFields() {
    image = XFile('').obs;
    selectedDate(DateTime(1960));
    isOpen = false.obs;
    textControllers = List.generate(2, (index) => TextEditingController());
  }
}
