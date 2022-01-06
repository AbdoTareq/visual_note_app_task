import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visual_note_app_task/constants.dart';
import 'package:visual_note_app_task/controller/note_controller.dart';
import 'package:visual_note_app_task/view/pages/add_note_page.dart';
import 'package:visual_note_app_task/view/widgets/app_drawer.dart';
import 'package:visual_note_app_task/view/widgets/custom_app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

// Page to list all or delete note
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
              : Column(
                  children: [
                    'Swip note to delete & tap to edit'.text.bold.xl.red500.make().p8(),
                    ListView.separated(
                        separatorBuilder: (context, index) => const Divider(height: 1),
                        itemCount: controller.notes.length,
                        itemBuilder: (context, index) {
                          final item = controller.notes[index];
                          return index == controller.notes.length
                              ? const Divider(height: 80)
                              : Dismissible(
                                  background: Container(color: Colors.red),
                                  key: Key(item.id.toString()),
                                  onDismissed: (direction) async => await controller.delete(item.id!),
                                  child: ListTile(
                                    onTap: () => Get.to(() => AddNotePage(item)),
                                    title: item.title.text.make(),
                                    subtitle: item.description.text.make(),
                                    leading:
                                        Image.file(File(item.image), width: 66, height: 66, fit: BoxFit.fill),
                                    trailing: Column(
                                      children: [
                                        item.dateInMiliSeconds.substring(0, 10).text.make().p8(),
                                        (item.isOpen == 1 ? 'Open' : 'Closed').text.make(),
                                      ],
                                    ),
                                  ),
                                );
                        }).expand(),
                  ],
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNotePage(null)),
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
