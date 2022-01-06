import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:visual_note_app_task/repos/note_repo.dart';

class HomeController extends GetxController {
  final NoteRepository repository;
  HomeController(this.repository);

  List<TextEditingController> textControllers = List.generate(2, (index) => TextEditingController());

  RxBool isOpen = false.obs;
}
