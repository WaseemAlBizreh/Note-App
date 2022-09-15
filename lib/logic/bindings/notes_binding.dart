import 'package:get/get.dart';
import '../../logic/controllers/notes_controller.dart';

class NoteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => NoteController(), permanent: true);
  }
}
