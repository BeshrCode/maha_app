import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/filter_widget.dart';

class SaraSessionController extends GetxController {
  // Add any state variables and methods needed for your controller
  RxInt selectedIndex = RxInt(0); // Rx variable to hold the selected index, initialized with 0
  List<String> items = ['Item 1', 'Item 2', 'Item 3']; // Example list of items
  final _isAgeRangeExpanded = Rxn<bool>(false); // Reactive variable for expansion state
  final _selectedDateFilter = Rxn<bool>(false); // Reactive variable for selected date filter
  final _ageRange = RangeValues(13.0, 17.0); // Reactive variable for age range

  // Accessors for filter selections (optional)
  bool get isAgeRangeExpanded => _isAgeRangeExpanded.value ?? false;
  bool get selectedDateFilter => _selectedDateFilter.value ?? false;
  RangeValues get ageRange => _ageRange;

  // Methods to update filter selections
  void toggleAgeRangeExpansion() => _isAgeRangeExpanded.toggle();
  void setSelectedDateFilter(bool value) => _selectedDateFilter.value = value;
  // void setAgeRange(RangeValues newRange) => _ageRange.value = newRange;

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
          insetPadding: EdgeInsets.all(0),
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
