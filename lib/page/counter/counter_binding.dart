import 'package:flutter_getx_app/page/counter/counter_controller.dart';
import 'package:get/instance_manager.dart';

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
  }
}
