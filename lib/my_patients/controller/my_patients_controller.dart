
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malath_sara/my_patients/view/my_patients_page.dart';
import 'package:malath_sara/schedule/view/schedule_page.dart';
import 'package:malath_sara/session/view/session_page.dart';

import '../../shared/filter_widget.dart';

class MyPatientsController extends GetxController {

  // Add any state variables and methods needed for your controller
  RxInt selectedIndex = RxInt(2); // Rx variable to hold the selected index, initialized with 0
  List<String> items = ['Schedule', 'Urgent Requests', 'My patients']; // Example list of items
  List<Widget> pages = [const SchedulePage(), const SessionPage(), const MyPatientsPage()]; // Example list of items

  // Original list of items
  List<String> originalItems = ['Sara Mohammed', 'John Doe', 'Alice Smith']; // Your original list of items

  // Filtered list of items
  RxList<String> filteredItems = RxList<String>();
  // Add TextEditingController for search bar
  final TextEditingController searchController = TextEditingController();


  void filterList(String query) {
    if (query.isEmpty) {
      filteredItems.assignAll(originalItems);
      return;
    }
    final lowerCaseQuery = query.toLowerCase();
    final filteredList = originalItems
        .where((item) => item.toLowerCase().contains(lowerCaseQuery))
        .toList();
    filteredItems.assignAll(filteredList);
  }

  void selectItem(int index) {
    selectedIndex.value = index; // Update the selected index
    if (kDebugMode) {
      print('$index');
    }
  }


  void showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(0),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FilterWidget()),
        );
      },
    );
  }

}
