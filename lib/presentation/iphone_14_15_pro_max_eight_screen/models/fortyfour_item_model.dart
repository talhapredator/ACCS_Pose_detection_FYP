import '../../../core/app_export.dart';

/// This class is used in the [fortyfour_item_widget] screen.
class FortyfourItemModel {
  FortyfourItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
