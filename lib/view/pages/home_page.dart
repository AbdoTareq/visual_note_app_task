import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visual_note_app_task/constants.dart';
import 'package:visual_note_app_task/controller/note_controller.dart';
import 'package:visual_note_app_task/view/pages/add_note_page.dart';
import 'package:visual_note_app_task/view/widgets/app_drawer.dart';
import 'package:visual_note_app_task/view/widgets/custom_app_bar.dart';
import 'package:visual_note_app_task/view/widgets/text_input.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends GetView<NoteController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Note App',
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: GetX<NoteController>(builder: (_) {
          return _.notes.isEmpty
              ? 'ar_no_data'.tr.text.makeCentered()
              : ListView.separated(
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    final item = controller.notes[index];
                    return index == controller.notes.length
                        ? const Divider(height: 80)
                        : ListTile(
                            title: item.title.text.make(),
                            subtitle: item.title.text.make(),
                            leading: Image.file(File(item.image), width: 66, height: 66, fit: BoxFit.fill),
                            trailing: Column(
                              children: [
                                item.dateInMiliSeconds.substring(0, 10).text.make().p8(),
                                (item.isOpen == 1 ? 'Open' : 'Closed').text.make(),
                              ],
                            ),
                          );
                  });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNotePage()),
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
