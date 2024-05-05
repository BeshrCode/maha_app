
import 'package:get/get.dart';
import '../controller/session_controller.dart';

class SaraSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaraSessionController());
  }
}