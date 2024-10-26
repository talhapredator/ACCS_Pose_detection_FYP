import '../controller/iphone_14_15_pro_max_seven_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone1415ProMaxSevenScreen.
///
/// This class ensures that the Iphone1415ProMaxSevenController is created when the
/// Iphone1415ProMaxSevenScreen is first loaded.
class Iphone1415ProMaxSevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone1415ProMaxSevenController());
  }
}
