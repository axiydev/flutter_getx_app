import 'package:flutter_getx_app/page/other/other_controller.dart';
import 'package:get/instance_manager.dart';

class OtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherController>(() => OtherController());
  }
}
