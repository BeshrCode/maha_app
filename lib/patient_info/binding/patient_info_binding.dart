


import 'package:get/get.dart';

import '../controller/patient_info_controller.dart';


class PatientInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PatientInController());
  }
}