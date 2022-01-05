import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visual_note_app_task/controller/home_controller.dart';
import 'package:visual_note_app_task/view/widgets/app_drawer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const AppDrawer(),
        body: ListView(
          children: [],
        ));
  }
}
