import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_three_screen/models/iphone_14_15_pro_max_three_model.dart';

/// A controller class for the Iphone1415ProMaxThreeScreen.
///
/// This class manages the state of the Iphone1415ProMaxThreeScreen, including the
/// current iphone1415ProMaxThreeModelObj
class Iphone1415ProMaxThreeController extends GetxController {
  Rx<Iphone1415ProMaxThreeModel> iphone1415ProMaxThreeModelObj =
      Iphone1415ProMaxThreeModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element
        in iphone1415ProMaxThreeModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    iphone1415ProMaxThreeModelObj.value.dropdownItemList.refresh();
  }
}
