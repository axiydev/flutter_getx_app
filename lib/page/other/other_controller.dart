import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';

class OtherController extends GetxController {
  late int count;
  @override
  void onInit() {
    count = 0;
    update();
    super.onInit();
  }

  @override
  void onClose() {
    log('ON CLOSE');
    super.onClose();
  }

  @override
  void onReady() {
    log('ON READY');
    super.onReady();
  }

  @override
  void dispose() {
    log('DISPOSE');
    super.dispose();
  }

  void inrement() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }
}
