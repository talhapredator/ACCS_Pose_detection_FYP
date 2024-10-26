import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_one_screen/iphone_14_15_pro_max_one_screen.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_one_screen/binding/iphone_14_15_pro_max_one_binding.dart';
import 'package:talha_s_application_demo/presentation/bat_sensor_connect_screen/bat_sensor_connect_screen.dart';
import 'package:talha_s_application_demo/presentation/bat_sensor_connect_screen/binding/bat_sensor_connect_binding.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_six_screen/iphone_14_15_pro_max_six_screen.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_six_screen/binding/iphone_14_15_pro_max_six_binding.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_seven_screen/iphone_14_15_pro_max_seven_screen.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_seven_screen/binding/iphone_14_15_pro_max_seven_binding.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_eight_screen/iphone_14_15_pro_max_eight_screen.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_eight_screen/binding/iphone_14_15_pro_max_eight_binding.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_two_container_screen/iphone_14_15_pro_max_two_container_screen.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_two_container_screen/binding/iphone_14_15_pro_max_two_container_binding.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_three_screen/iphone_14_15_pro_max_three_screen.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_three_screen/binding/iphone_14_15_pro_max_three_binding.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_four_screen/iphone_14_15_pro_max_four_screen.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_four_screen/binding/iphone_14_15_pro_max_four_binding.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_five_screen/iphone_14_15_pro_max_five_screen.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_five_screen/binding/iphone_14_15_pro_max_five_binding.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_nine_screen/iphone_14_15_pro_max_nine_screen.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_nine_screen/binding/iphone_14_15_pro_max_nine_binding.dart';
import 'package:talha_s_application_demo/presentation/frame_two_screen/frame_two_screen.dart';
import 'package:talha_s_application_demo/presentation/frame_two_screen/binding/frame_two_binding.dart';
import 'package:talha_s_application_demo/presentation/balling_machine_connect_screen/balling_machine_connect_screen.dart';
import 'package:talha_s_application_demo/presentation/balling_machine_connect_screen/binding/balling_machine_connect_binding.dart';
import 'package:talha_s_application_demo/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:talha_s_application_demo/presentation/app_navigation_screen/binding/app_navigation_binding.dart';

import 'package:talha_s_application_demo/presentation/email_authentication/email_authentication.dart';
import 'package:talha_s_application_demo/presentation/email_authentication/binding/email_authentication_binding.dart';
import 'package:talha_s_application_demo/presentation/two_factor/controller/two_factor_controller.dart';
import 'package:talha_s_application_demo/presentation/two_factor/binding/two_factor_binding.dart';

import 'package:get/get.dart';
import 'package:talha_s_application_demo/presentation/start_screen/iphone_1415_pro_max_1.dart';
import 'package:talha_s_application_demo/presentation/two_factor/two_factor.dart';

class AppRoutes {
  static const String iphone1415ProMaxOneScreen =
      '/iphone_14_15_pro_max_one_screen';

  static const String batSensorConnectScreen = '/bat_sensor_connect_screen';

  static const String iphone1415ProMaxSixScreen =
      '/iphone_14_15_pro_max_six_screen';

  static const String iphone1415ProMaxSevenScreen =
      '/iphone_14_15_pro_max_seven_screen';

  static const String iphone1415ProMaxEightScreen =
      '/iphone_14_15_pro_max_eight_screen';

  static const String iphone1415ProMaxTwoPage =
      '/iphone_14_15_pro_max_two_page';

  static const String iphone1415ProMaxTwoContainerScreen =
      '/iphone_14_15_pro_max_two_container_screen';

  static const String iphone1415ProMaxThreeScreen =
      '/iphone_14_15_pro_max_three_screen';

  static const String iphone1415ProMaxFourScreen =
      '/iphone_14_15_pro_max_four_screen';

  static const String iphone1415ProMaxFiveScreen =
      '/iphone_14_15_pro_max_five_screen';

  static const String iphone1415ProMaxNineScreen =
      '/iphone_14_15_pro_max_nine_screen';

  static const String frameTwoScreen = '/frame_two_screen';

  static const String ballingMachineConnectScreen =
      '/balling_machine_connect_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String EmailAuthentication = '/email_authentication';

  static const String twoFactor = '/two_factor';

  static List<GetPage> pages = [
    GetPage(
      name: iphone1415ProMaxOneScreen,
      page: () => Iphone1415ProMaxOneScreen(),
      bindings: [
        Iphone1415ProMaxOneBinding(),
      ],
    ),
    GetPage(
      name: batSensorConnectScreen,
      page: () => BatSensorConnectScreen(),
      bindings: [
        BatSensorConnectBinding(),
      ],
    ),
    GetPage(
      name: iphone1415ProMaxSixScreen,
      page: () => Iphone1415ProMaxSixScreen(),
      bindings: [
        Iphone1415ProMaxSixBinding(),
      ],
    ),
    GetPage(
      name: iphone1415ProMaxSevenScreen,
      page: () => Iphone1415ProMaxSevenScreen(),
      bindings: [
        Iphone1415ProMaxSevenBinding(),
      ],
    ),
    GetPage(
      name: iphone1415ProMaxEightScreen,
      page: () => Iphone1415ProMaxEightScreen(),
      bindings: [
        Iphone1415ProMaxEightBinding(),
      ],
    ),
    GetPage(
      name: EmailAuthentication,
      page: () => EmailAuthenticationScreen(),
      bindings: [
        EmailAuthenticationBinding(),
      ],
    ),
    GetPage(
      name: twoFactor,
      page: () => TwoFactorScreen(),
      bindings: [
        TwoFactorBinding(),
      ],
    ),
    GetPage(
      name: iphone1415ProMaxTwoContainerScreen,
      page: () => Iphone1415ProMaxTwoContainerScreen(),
      bindings: [
        Iphone1415ProMaxTwoContainerBinding(),
      ],
    ),
    GetPage(
      name: iphone1415ProMaxThreeScreen,
      page: () => Iphone1415ProMaxThreeScreen(),
      bindings: [
        Iphone1415ProMaxThreeBinding(),
      ],
    ),
    GetPage(
      name: iphone1415ProMaxFourScreen,
      page: () => Iphone1415ProMaxFourScreen(),
      bindings: [
        Iphone1415ProMaxFourBinding(),
      ],
    ),
    GetPage(
      name: iphone1415ProMaxFiveScreen,
      page: () => Iphone1415ProMaxFiveScreen(),
      bindings: [
        Iphone1415ProMaxFiveBinding(),
      ],
    ),
    GetPage(
      name: iphone1415ProMaxNineScreen,
      page: () => Iphone1415ProMaxNineScreen(),
      bindings: [
        Iphone1415ProMaxNineBinding(),
      ],
    ),
    GetPage(
      name: frameTwoScreen,
      page: () => FrameTwoScreen(),
      bindings: [
        FrameTwoBinding(),
      ],
    ),
    GetPage(
      name: ballingMachineConnectScreen,
      page: () => BallingMachineConnectScreen(),
      bindings: [
        BallingMachineConnectBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => Iphone1415ProMax1(),
    )
  ];
}
