

import 'package:get_it/get_it.dart';
import 'package:notes/app/config/theme/helper/themeviewmodel.dart';



GetIt getIt = GetIt.instance;

class ServiceLocator {
  static init() {
getIt.registerSingleton<ThemeViewModel>(ThemeViewModel());

  }

  static T get<T extends Object>() {
    return getIt.get<T>();
  }
}
//LocaleProvider GradeSelected