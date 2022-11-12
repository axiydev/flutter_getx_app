import 'package:flutter_getx_app/page/counter/counter_controller.dart';
import 'package:flutter_getx_app/page/quote/quote_controller.dart';
import 'package:get/instance_manager.dart';

class QuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuoteController>(() => QuoteController());
    Get.lazyPut<CounterController>(() => CounterController());
  }
}
