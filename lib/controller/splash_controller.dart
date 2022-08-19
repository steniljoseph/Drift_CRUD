import 'package:demo/pages/home_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  navigate() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.off(const HomeScreen());
  }
}
