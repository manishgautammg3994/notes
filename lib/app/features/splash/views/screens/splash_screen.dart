library splash;

import '/app/config/routes/app_pages.dart';
import '/app/utils/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// binding
part '../../bindings/splash_binding.dart';

// controller
part '../../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: controller.isLoading.value
              ? const CircularProgressIndicator() //Place Your Splash Screen Here //TODO
              : const SizedBox(),
        ),
      ),
    );
  }
}
