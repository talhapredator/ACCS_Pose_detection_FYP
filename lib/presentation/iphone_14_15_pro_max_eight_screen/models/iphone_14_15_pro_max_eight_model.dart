import 'fortyfour_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [iphone_14_15_pro_max_eight_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class Iphone1415ProMaxEightModel {
  Rx<List<FortyfourItemModel>> fortyfourItemList =
      Rx(List.generate(4, (index) => FortyfourItemModel()));
}
