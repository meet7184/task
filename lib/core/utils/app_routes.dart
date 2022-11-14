import 'package:demotask/ui/home_screen/home_screen.dart';
import 'package:get/get.dart';

import '../../ui/localauth/face_auth.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
  GetPage(name: FaceScreen.routeName, page: () => const FaceScreen()),
];
