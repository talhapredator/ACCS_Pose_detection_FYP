import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:talha_s_application_demo/presentation/balling_machine_connect_screen/models/balling_machine_connect_model.dart';
import 'package:flutter/foundation.dart';

class BallingMachineConnectController extends GetxController {
  Rx<BallingMachineConnectModel> ballingMachineConnectModelObj =
      BallingMachineConnectModel().obs;

  var isConnected = false.obs;
  bool ledstatus = false;
  IOWebSocketChannel? channel;
  bool connected = false;
  IOWebSocketChannel? webSocketChannel;

  // Initialize the WebSocket channel in the constructor
  BallingMachineConnectController() {
    connectWebSocket();
  }

  Future<void> connectWebSocket() async {
    try {
      webSocketChannel = IOWebSocketChannel.connect("ws://192.168.0.1:81");
      webSocketChannel!.stream.listen(
            (message) {
          print(message);
          // Handle incoming messages as needed
          if (message == "connected") {
            isConnected.value = true;
          } else if (message == "disconnected") {
            isConnected.value = false;
          }
        },
        onDone: () {
          print("WebSocket is closed");
          // Handle WebSocket closure
          isConnected.value = false;
        },
        onError: (error) {
          print("WebSocket error: $error");
        },
      );
    } catch (error) {
      print("Error on connecting to WebSocket: $error");
    }
  }

  Future<void> disconnectWebSocket() async {
    try {
      webSocketChannel?.sink.close();
      isConnected.value = false;
    } catch (error) {
      print("Error on disconnecting WebSocket: $error");
    }
  }

  Future<void> sendCmd(String cmd) async {
    if (isConnected.value == true) {
      if (ledstatus == false && cmd != "poweron" && cmd != "poweroff") {
        print("Send the valid command");
      } else {
        channel?.sink.add(cmd);
      }
    }
  }

  void sendDataToPoseDetector(String data) {
    // Send the received data to the NodeMCU
    sendDataToNodeMCU(data);
  }

  void sendDataToNodeMCU(String data) {
    // Here, you would send the data to the NodeMCU
    // For demonstration purposes, print the data
    print('Sending data to NodeMCU: $data');
    // Assuming you have a WebSocket channel set up for NodeMCU communication
    if (webSocketChannel != null && webSocketChannel!.sink != null) {
      webSocketChannel!.sink.add(data);
    } else {
      print('WebSocket channel not available');
    }
  }
}
