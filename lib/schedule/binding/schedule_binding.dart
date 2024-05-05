
import 'package:get/get.dart';

import '../controller/schedule_controller.dart';

class scheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleController());
  }
}