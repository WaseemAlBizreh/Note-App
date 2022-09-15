import 'package:get/get.dart';

import '../../logic/bindings/notes_binding.dart';
import '../../view/screens/note_screen.dart';

class AppRoutes {
  //initial Route
  static String initialRoute = Routes.noteScreen;

  static final routes = [
    GetPage(
      name: Routes.noteScreen,
      page: () => NoteScreenView(),
      binding: NoteBinding(),
    ),
  ];
}

class Routes {
  static const noteScreen = '/note_screen';
}
