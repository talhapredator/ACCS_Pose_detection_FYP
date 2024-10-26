import 'package:talha_s_application_demo/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [iphone_14_15_pro_max_three_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class Iphone1415ProMaxThreeModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "110 Kph",
      value: "110",
    ),
    SelectionPopupModel(
      id: 2,
      title: "120 Kph",
      value: "120",
    ),

  ]);
  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([

    SelectionPopupModel(
      id: 2,
      title: "5 sec",
      value: "5",
    ),
    SelectionPopupModel(
      id: 3,
      title: "10 sec",
      value: "10",
    )
  ]);
}