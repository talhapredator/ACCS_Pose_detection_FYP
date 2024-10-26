import '../controller/iphone_14_15_pro_max_eight_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone1415ProMaxEightScreen.
///
/// This class ensures that the Iphone1415ProMaxEightController is created when the
/// Iphone1415ProMaxEightScreen is first loaded.
class Iphone1415ProMaxEightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone1415ProMaxEightController());
  }
}
