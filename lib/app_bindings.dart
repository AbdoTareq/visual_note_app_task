import 'package:get/get.dart';
import 'package:visual_note_app_task/repos/note_repo.dart';
import 'controller/note_controller.dart';
import 'controller/app_settings_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppSettingsController(), permanent: true).addThemeListener();
    Get.find<AppSettingsController>().addLanguageListener();
    Get.lazyPut<NoteController>(() => NoteController(DbManager()));
  }
}
