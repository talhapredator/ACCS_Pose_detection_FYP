import '../controller/iphone_14_15_pro_max_six_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone1415ProMaxSixScreen.
///
/// This class ensures that the Iphone1415ProMaxSixController is created when the
/// Iphone1415ProMaxSixScreen is first loaded.
class Iphone1415ProMaxSixBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone1415ProMaxSixController());
  }
}
