import '../controller/two_factor_controller.dart';
import 'package:get/get.dart';

class TwoFactorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TwoFactorController());
  }
}
