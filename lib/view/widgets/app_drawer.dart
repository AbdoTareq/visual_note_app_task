import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:visual_note_app_task/controller/app_settings_controller.dart';

class AppDrawer extends GetView<AppSettingsController> {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => SwitchListTile(
                title: 'darkMode'.tr.text.make(),
                value: controller.darkMode.value,
                onChanged: (_) {
                  controller.darkMode.toggle();
                  controller.box.write('dark', controller.darkMode.value);
                }),
          ),
          Obx(
            () => SwitchListTile(
                title: 'language'.tr.text.make(),
                value: controller.lang.value,
                onChanged: (_) {
                  controller.lang.toggle();
                  controller.box.write('language', controller.lang.value);
                }),
          ),
        ],
      ).centered(),
    );
  }
}
