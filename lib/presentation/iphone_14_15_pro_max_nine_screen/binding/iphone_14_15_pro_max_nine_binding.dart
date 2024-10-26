import '../controller/iphone_14_15_pro_max_nine_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone1415ProMaxNineScreen.
///
/// This class ensures that the Iphone1415ProMaxNineController is created when the
/// Iphone1415ProMaxNineScreen is first loaded.
class Iphone1415ProMaxNineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone1415ProMaxNineController());
  }
}
