import '../controller/frame_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FrameTwoScreen.
///
/// This class ensures that the FrameTwoController is created when the
/// FrameTwoScreen is first loaded.
class FrameTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FrameTwoController());
  }
}
