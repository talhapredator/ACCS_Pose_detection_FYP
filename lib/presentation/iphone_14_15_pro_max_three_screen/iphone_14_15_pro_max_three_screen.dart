import 'controller/iphone_14_15_pro_max_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_two_page/iphone_14_15_pro_max_two_page.dart';
import 'package:talha_s_application_demo/widgets/app_bar/appbar_leading_image.dart';
import 'package:talha_s_application_demo/widgets/app_bar/appbar_title.dart';
import 'package:talha_s_application_demo/widgets/app_bar/custom_app_bar.dart';
import 'package:talha_s_application_demo/widgets/custom_bottom_bar.dart';
import 'package:talha_s_application_demo/widgets/custom_drop_down.dart';
import 'package:talha_s_application_demo/widgets/custom_elevated_button.dart';
import 'package:talha_s_application_demo/model/bowling_machine_model.dart';
import 'package:talha_s_application_demo/database/db_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';


class Iphone1415ProMaxThreeScreen extends GetWidget<Iphone1415ProMaxThreeController> {
  IOWebSocketChannel? webSocketChannel;

  bool connected = false;
  bool ledStatus = false;

  String speed = "0";
  String time = "0";

  Iphone1415ProMaxThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          padding: EdgeInsets.only(top: 88.v, bottom: 64.v),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.test1),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 26.v),
            child: Column(
              children: [
                _buildEighteen(),
                SizedBox(height: 68.v),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.h),
                  padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.v),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: -5,
                        left: 0,
                        right: 0,

                        child: Center(
                          child: Text(
                            "Control Panel",
                            style: TextStyle(
                              fontSize: 18, // Adjust the font size as needed
                              fontWeight: FontWeight.bold, // Optionally adjust the font weight
                              color: Colors.white, // Optionally adjust the text color
                              shadows: [
                                Shadow(
                                  color: Colors.white.withOpacity(0.8), // Shadow color
                                  offset: Offset(1, 4), // Shadow offset
                                  blurRadius: 20, // Shadow blur radius
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 40.v, bottom: 120.v),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: Text(
                                    "lbl_speed_limit".tr,
                                    style: theme.textTheme.bodyLarge,

                                  ),
                                ),
                                SizedBox(height: 10.v),

                                CustomDropDown(
                                  width: 173.h,
                                  dropdownColor: Colors.white,

                                  icon: Container(
                                    margin: EdgeInsets.fromLTRB(14.h, 2.v, 5.h, 2.v),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgTelevision,
                                      height: 10.v,
                                      width: 10.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintText: "lbl_select".tr,
                                  items: controller
                                      .iphone1415ProMaxThreeModelObj
                                      .value
                                      .dropdownItemList!
                                      .value,
                                  onChanged: (value) {
                                    controller.onSelected(value);
                                    _sendCmd(value.value);
                                  },
                                ),
                                SizedBox(height: 155.v),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: Text(
                                    "lbl_delay".tr,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ),
                                SizedBox(height: 7.v),
                                CustomDropDown(
                                  width: 173.h,
                                  dropdownColor: Colors.white,
                                  icon: Container(
                                    margin: EdgeInsets.fromLTRB(14.h, 2.v, 5.h, 2.v),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgTelevision,
                                      height: 10.v,
                                      width: 10.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintText: "lbl_select".tr,
                                  items: controller
                                      .iphone1415ProMaxThreeModelObj
                                      .value
                                      .dropdownItemList1!
                                      .value,

                                  onChanged: (value) {
                                    controller.onSelected(value);
                                    _sendCmd(value.value);

                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 35.v),
                            padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 5.v),
                            decoration: AppDecoration.fillwhite.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "msg_activate_machine".tr,
                                  style: CustomTextStyles.bodyMediumRegular,
                                ),
                                SizedBox(height: 12.v),
                                CustomElevatedButton(
                                  height: 51.v,
                                  width: 124.h,

                                  text: "lbl_start".tr,
                                  buttonStyle: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Set background color to transparent
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black12), // Set text color to white
                                    elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0 to remove shadow
                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder( // Optionally, set the button shape
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.white, width: 1.3),
                                      ),
                                    ),
                                  ),

                                  onPressed: () {
                                    onTapStartButton();
                                    _sendCmd("start");
                                  },


                                ),
                                SizedBox(height: 161.v),
                                CustomElevatedButton(
                                  height: 51.v,
                                  width: 124.h,
                                  text: "lbl_stop".tr,
                                  buttonStyle: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Set background color to transparent
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black12), // Set text color to white
                                    elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0 to remove shadow
                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder( // Optionally, set the button shape
                                        borderRadius: BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.white, width: 1.3),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    onTapStopButton();

                                    _sendCmd("stop");


                                  },

                                ),
                                SizedBox(height: 29.v),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }



  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 67.h,
      leading: IconButton(
        icon: Icon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
      centerTitle: true,
      title: Text(
        "lbl_status".tr,
        style: TextStyle(
          color: Colors.white, // Change to your desired text color
        ),
      ),
      styleType: Style.bgFill_2,
    );


  }

  Widget _buildEighteen() {
    return Container(
      margin: EdgeInsets.only(right: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 34.h, vertical: 27.v),
      decoration: AppDecoration.fillorange.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder26,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_device_is".tr,
            style: CustomTextStyles.titleLargeBlack900,
          ),
          Padding(
            padding: EdgeInsets.only(right: 71.h),
            child: Text(
              "lbl_connected".tr,
              style: CustomTextStyles.titleLargeDeeporangeA700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Get.toNamed(getCurrentRoute(type));
      },
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Connection:
        return AppRoutes.iphone1415ProMaxTwoContainerScreen;
      case BottomBarEnum.Controls:
        return AppRoutes.iphone1415ProMaxThreeScreen;
      case BottomBarEnum.Edit:
        return AppRoutes.iphone1415ProMaxFourScreen;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.iphone1415ProMaxTwoPage:
        return Iphone1415ProMaxTwoPage();
      default:
        return DefaultWidget();
    }
  }

  onPressed() {
    Get.toNamed(AppRoutes.iphone1415ProMaxTwoContainerScreen);
  }

  onTapStartButton() async {
    // Generate a unique session ID
    int sessionId = generateSessionId();

    // Get the current time as the start time
    DateTime startTime = DateTime.now().toUtc();

    // Fetch the username of the currently logged-in user
    String loggedInUsername = 'saadbrr'; // Replace with your logic to get the actual username

    // Create a BowlingMachine object
    BowlingMachine machine = BowlingMachine(
      sessionId: sessionId,
      startTime: startTime,
      stopTime: null, // Since it's the start button, stop time is initially null
      speed: 0,
      swingType: "",
      username: loggedInUsername, // Use the fetched username
    );

    // Insert the BowlingMachine object into the database
    await BowlingMachineDBHelper.instance.insertBowlingMachine(machine);

    // Add your logic for handling the start button click
  }


  onTapStopButton() async {
    int sessionId = getCurrentSessionId();
    DateTime stopTime = DateTime.now().toUtc();

    // Format the stopTime to display in hours, minutes, and seconds
    String formattedStopTime = '${stopTime.hour}:${stopTime.minute}:${stopTime.second}';

    await BowlingMachineDBHelper.instance.updateBowlingMachineStopTime(sessionId, formattedStopTime);
    // WebSocket logic - Disconnect from NodeMCU
    await _disconnectWebSocket();
    // Add your logic for handling the stop button click
  }


  int generateSessionId() {
    // You need to implement the logic to generate a unique session ID
    // For example, you can use a random number generator or other methods
    return 7; // Replace with your implementation
  }

  int getCurrentSessionId() {
    // You need to implement the logic to get the current session ID
    // This might involve querying the database or using some other mechanism
    return 7; // Replace with your implementation
  }
  Future<void> _connectWebSocket() async {
    try {
      webSocketChannel = IOWebSocketChannel.connect("ws://192.168.0.1:81");
      webSocketChannel!.stream.listen(
            (message) {
          print(message);
          // Handle incoming messages as needed
          if (message == "connected") {
            connected = true;
          } else if (message == "poweron:success") {
            ledStatus = true;
          } else if (message == "stop") {
            ledStatus = false;
          }
        },
        onDone: () {
          print("WebSocket is closed");
          // Handle WebSocket closure
          connected = false;
        },
        onError: (error) {
          print("WebSocket error: $error");
        },
      );
    } catch (error) {
      print("Error on connecting to WebSocket: $error");
    }
  }

  Future<void> _disconnectWebSocket() async {
    try {
      webSocketChannel?.sink.close();
      connected = false;
    } catch (error) {
      print("Error on disconnecting WebSocket: $error");
    }
  }

  Future<void> _sendCmd(String time) async {
    if (connected == true) {

      webSocketChannel?.sink.add(time);


    } else {
      await _connectWebSocket();
      print("WebSocket is not connected.");
    }
  }

  @override
  Widget build2(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LED - ON/OFF NodeMCU"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: connected
                  ? const Text("WEBSOCKET: CONNECTED")
                  : const Text("DISCONNECTED"),
            ),
            Container(
              child: ledStatus ? const Text("LED IS: ON") : const Text("LED IS: OFF"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //  primary: Colors.redAccent,
                  //onPrimary: Colors.white,
                ),
                onPressed: () {
                  // if (ledStatus) {
                  //   _sendCmd("poweroff");
                  //   ledStatus = false;
                  // } else {
                  //   _sendCmd("poweron");
                  //   ledStatus = true;
                  // }
                },
                child: ledStatus
                    ? const Text("TURN LED OFF")
                    : const Text("TURN LED ON"),
              ),
            ),
          ],
        ),
      ),
    );
  }




}