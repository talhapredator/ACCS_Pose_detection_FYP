import '../../../core/app_export.dart';
import 'custobox_item_model.dart';

/// This class defines the variables used in the [iphone_14_15_pro_max_two_page],
/// and is typically used to hold data that is passed between different parts of the application.
class Iphone1415ProMaxTwoModel {
  Rx<List<CustoboxItemModel>> custoboxItemList = Rx([
    CustoboxItemModel(
        customizationImage: ImageConstant.imgRectangle20.obs,
        customizationText: "Customization".obs,
        customizationDescription:
            "Here You can customize your personal account data, Your Profile or\nset a new profile."
                .obs),
    CustoboxItemModel(
        customizationImage: ImageConstant.imgRectangle2037x40.obs,
        customizationText: "Training Session".obs,
        customizationDescription:
            "Start your journey to play just like the cricketing stars play."
                .obs),
    CustoboxItemModel(
        customizationImage: ImageConstant.imgRectangle2040x40.obs,
        customizationText: "User Manual".obs,
        customizationDescription:
        "Get to know us and to use our advanced cricket training App."
            .obs)
  ]);
}
