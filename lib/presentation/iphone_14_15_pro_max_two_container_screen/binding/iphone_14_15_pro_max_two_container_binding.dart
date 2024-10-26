import '../controller/iphone_14_15_pro_max_two_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone1415ProMaxTwoContainerScreen.
///
/// This class ensures that the Iphone1415ProMaxTwoContainerController is created when the
/// Iphone1415ProMaxTwoContainerScreen is first loaded.
class Iphone1415ProMaxTwoContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone1415ProMaxTwoContainerController());
  }
}
