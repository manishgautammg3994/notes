import 'package:firebase_core/firebase_core.dart'; //  for firebase initialization
import 'package:flutter/material.dart'; //for widget Binding and widgets
import 'package:get/get.dart'; //import getx
import 'package:get_storage/get_storage.dart'; //alternate of Shared Preference
import 'app/config/routes/app_pages.dart';
import 'app/config/servicelocator.dart';
import 'app/config/theme/app_basic_theme.dart';
import 'app/config/theme/helper/themeviewmodel.dart';
import 'firebase_options.dart'; //for config of firebase credential and devices

void main() async {
//Youcan code your worker isolate here but remember reinitializing Get Storage and WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  ServiceLocator
      .init(); // even you can prefer getxservices for singolton dependecy injection but in that case you have to call that after   WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

///////////////////////////You Can Code Here ///////////////////////////////////
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static ThemeViewModel get themeService =>
      ServiceLocator.get<ThemeViewModel>();

  // This widget is the root of your application. LocaleProvider
  @override
  void initState() {
    //advanced design for theme management and locale management
    super.initState();
    themeService.only_first_run_oninit();
    if (themeService.isAutomatic) {
      themeService.selectThemeAutomatic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rural vypar', //TODO change This
      theme: AppBasicTheme.getThemeDataLight(),
      darkTheme: AppBasicTheme.getThemeDataDark(),
      themeMode: themeService.theme,
      initialRoute: AppPages.initial, //Routes.dashboard,//
      getPages: AppPages.routes,
    );
  }
}
