import 'package:get/get.dart';
import 'package:note_app/view/screens/home_screen.dart';

class AppRoutes {
  //initial Route
  static String initialRoute = Routes.homeScreen;

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreenView(),
    ),
  ];
}

class Routes {
  static const homeScreen = '/home_screen';
}
