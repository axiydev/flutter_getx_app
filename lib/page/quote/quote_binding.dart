import 'package:flutter_getx_app/page/counter/counter_controller.dart';
import 'package:flutter_getx_app/page/quote/quote_controller.dart';
import 'package:get/instance_manager.dart';

import 'detail/detail_controller.dart';

class QuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuoteController>(() => QuoteController());
    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<DetailController>(() => DetailController());
  }
}
