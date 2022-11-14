import 'package:demotask/ui/localauth/face_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'core/constant/app_themes.dart';
import 'core/local_db/moor_db.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingletonAsync(() => MoorDbClient.getInstance());
  await GetIt.I.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Istreamo Task",
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: FaceScreen.routeName,
      getPages: routes,
      theme: AppTheme.defTheme,
    );
  }
}
