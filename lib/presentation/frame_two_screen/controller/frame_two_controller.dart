import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/frame_two_screen/models/frame_two_model.dart';

/// A controller class for the FrameTwoScreen.
///
/// This class manages the state of the FrameTwoScreen, including the
/// current frameTwoModelObj
class FrameTwoController extends GetxController {
  Rx<FrameTwoModel> frameTwoModelObj = FrameTwoModel().obs;
}
