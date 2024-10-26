import 'controller/iphone_14_15_pro_max_seven_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:talha_s_application_demo/core/app_export.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_two_page/iphone_14_15_pro_max_two_page.dart';
import 'package:talha_s_application_demo/widgets/custom_bottom_bar.dart';
import 'package:talha_s_application_demo/widgets/custom_elevated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talha_s_application_demo/presentation/playlist_screen/playlist.dart';


class Iphone1415ProMaxSevenScreen extends StatefulWidget {
  const Iphone1415ProMaxSevenScreen({Key? key}) : super(key: key);

  @override
  _Iphone1415ProMaxSevenScreenState createState() => _Iphone1415ProMaxSevenScreenState();
}

class _Iphone1415ProMaxSevenScreenState extends State<Iphone1415ProMaxSevenScreen> {
  final Iphone1415ProMaxSevenController controller = Get.put(Iphone1415ProMaxSevenController());
  bool isConnecting = false;
  BluetoothDevice? connectedDevice;
  BluetoothCharacteristic? dataCharacteristic;
  String sensorData = "No data";

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    var status = await Permission.bluetoothScan.status;
    if (!status.isGranted) {
      await Permission.bluetoothScan.request();
    }

    status = await Permission.bluetoothConnect.status;
    if (!status.isGranted) {
      await Permission.bluetoothConnect.request();
    }

    status = await Permission.locationWhenInUse.status;
    if (!status.isGranted) {
      await Permission.locationWhenInUse.request();
    }
  }

  void _connectToBluetooth(BuildContext context) async {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    setState(() {
      isConnecting = true;
    });

    try {
      // Retrieve the list of connected devices
      List<BluetoothDevice> connectedDevices = await flutterBlue.connectedDevices;
      print('Connected devices: ${connectedDevices.map((d) => d.name).toList()}');

      // Check if the target device is already connected
      for (BluetoothDevice device in connectedDevices) {
        if (device.name == 'TF4Micro - Motion Kit - 346C') {
          print('Device already connected: ${device.name}');
          _connectToDevice(device, context);
          return;
        }
      }

      // If not, start scanning for devices
      flutterBlue.startScan(timeout: Duration(seconds: 10));
      print('Started scanning for devices...');

      // Listen to scan results
      flutterBlue.scanResults.listen((results) {
        for (ScanResult r in results) {
          print('Scan result: ${r.device.name} - ${r.device.id}');
          if (r.device.name == 'TF4Micro - Motion Kit - 346C') {
            print('Target device found: ${r.device.name}');
            flutterBlue.stopScan();
            _connectToDevice(r.device, context);
            break;
          }
        }
      });
    } catch (e) {
      print('Connection error: $e');
      setState(() {
        isConnecting = false;
      });
      _showConnectionFailedMessage(context);
    }
  }

  void _connectToDevice(BluetoothDevice device, BuildContext context) async {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    try {
      print('Connecting to device: ${device.name}');
      await device.connect();
      setState(() {
        connectedDevice = device;
        isConnecting = false;
      });
      print('Connected to ${device.name}');
      _showConnectionSuccessMessage(context);

      // Discover services
      List<BluetoothService> services = await device.discoverServices();
      for (BluetoothService service in services) {
        for (BluetoothCharacteristic characteristic in service.characteristics) {
          print('Found characteristic: ${characteristic.uuid}');
          if (characteristic.uuid.toString() == "81c30e5c-1001-4f7d-a886-de3e90749161") { // Data provider characteristic
            dataCharacteristic = characteristic;
            await characteristic.setNotifyValue(true);
            characteristic.value.listen((value) {
              setState(() {
                sensorData = value.toString();
              });
              print('Received data: $value');
            });
          }
        }
      }
    } catch (e) {
      print('Connection error: $e');
      setState(() {
        isConnecting = false;
      });
      _showConnectionFailedMessage(context);

      // Ensure scanning is stopped in case of an error
      flutterBlue.stopScan();
    }
  }



  void _showConnectionFailedMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'Connection failed: No Bluetooth device detected',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.redAccent,
      action: SnackBarAction(
        label: 'Retry',
        textColor: Colors.yellow,
        onPressed: () {
          _connectToBluetooth(context);
        },
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showConnectionSuccessMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'Connected to ${connectedDevice!.name}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          padding: EdgeInsets.only(bottom: 20.v),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.test1),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            child: Column(
              children: [
                _buildArrowDownTraining(),
                Spacer(flex: 10),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 340.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Connect Your Bat Sensor",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 10.0),
                            CustomElevatedButton(
                              width: 80.0,
                              text: "Connect",
                              onPressed: () => _connectToBluetooth(context),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                Spacer(flex: 10),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent.withOpacity(0.94),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 340.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pose Detection System",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 10.0),
                            CustomElevatedButton(
                              width: 80.0,
                              text: "Start",
                              onPressed: onTapConnectBatSensor,
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                Spacer(flex: 10),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: 340.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Playlist",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 10.0),
                            CustomElevatedButton(
                              width: 80.0,
                              text: "Replay",
                              onPressed: _navigateToPlaylist,
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                Spacer(flex: 15),
                Text(
                  'Sensor Data: $sensorData',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  Widget _buildArrowDownTraining() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 21.v),
      decoration: AppDecoration.fillPrimary1,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.deepOrange.shade800,
            ),
            onPressed: onPressed,
          ),
          Padding(
            padding: EdgeInsets.only(left: 85.h, top: 2.v),
            child: Text(
              "Features".tr,
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

  void _navigateToPlaylist() {
    Get.to(PlaylistScreen());
  }

  onTapConnectBatSensor() {
    Get.toNamed(AppRoutes.batSensorConnectScreen);
  }

  onTapPlaylist() {
    Get.to(PlaylistScreen());
  }

  onPressed() {
    Get.toNamed(AppRoutes.iphone1415ProMaxTwoContainerScreen);
  }
}

void main() {
  runApp(MaterialApp(
    home: Iphone1415ProMaxSevenScreen(),
  ));
}
