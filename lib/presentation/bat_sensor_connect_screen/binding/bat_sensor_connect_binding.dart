import '../controller/bat_sensor_connect_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BatSensorConnectScreen.
///
/// This class ensures that the BatSensorConnectController is created when the
/// BatSensorConnectScreen is first loaded.
class BatSensorConnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BatSensorConnectController());
  }
}
