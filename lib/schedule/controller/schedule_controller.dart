import 'dart:async';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController {
  // Add any state variables and methods needed for your controller
  RxInt selectedIndex = RxInt(0); // Rx variable to hold the selected index, initialized with 0
  List<String> items = ['Item 1', 'Item 2', 'Item 3']; // Example list of items

  void selectItem(int index) {
    selectedIndex.value = index; // Update the selected index
    if (kDebugMode) {
      print('$index');
    }
  }
}
