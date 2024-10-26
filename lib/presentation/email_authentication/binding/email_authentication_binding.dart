import '../controller/email_authentication_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone1415ProMaxOneScreen.
///
/// This class ensures that the Iphone1415ProMaxOneController is created when the
/// Iphone1415ProMaxOneScreen is first loaded.
class EmailAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailAuthenticationController());
  }
}
