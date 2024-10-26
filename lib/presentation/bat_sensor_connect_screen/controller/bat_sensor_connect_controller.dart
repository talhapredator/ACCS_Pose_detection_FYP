import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/bat_sensor_connect_screen/models/bat_sensor_connect_model.dart';

/// A controller class for the BatSensorConnectScreen.
///
/// This class manages the state of the BatSensorConnectScreen, including the
/// current batSensorConnectModelObj
class BatSensorConnectController extends GetxController {
  Rx<BatSensorConnectModel> batSensorConnectModelObj =
      BatSensorConnectModel().obs;
}
