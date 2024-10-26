import '../controller/balling_machine_connect_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BallingMachineConnectScreen.
///
/// This class ensures that the BallingMachineConnectController is created when the
/// BallingMachineConnectScreen is first loaded.
class BallingMachineConnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BallingMachineConnectController());
  }
}
