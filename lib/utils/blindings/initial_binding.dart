import 'package:get/get.dart';
import 'package:lmm_pos/controllers/home_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
