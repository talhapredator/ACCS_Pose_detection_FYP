import '../../../core/app_export.dart';

/// This class is used in the [custobox_item_widget] screen.
class CustoboxItemModel {
  CustoboxItemModel({
    this.customizationImage,
    this.customizationText,
    this.customizationDescription,
    this.id,
  }) {
    customizationImage = customizationImage ?? Rx(ImageConstant.imgRectangle20);
    customizationText = customizationText ?? Rx("Customization");
    customizationDescription = customizationDescription ??
        Rx("Here You can customize your personal account data, Your Profile or\n       set a new profile.");
    id = id ?? Rx("");
  }

  Rx<String>? customizationImage;

  Rx<String>? customizationText;

  Rx<String>? customizationDescription;

  Rx<String>? id;
}
