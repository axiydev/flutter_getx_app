import 'package:flutter/material.dart';
import 'package:flutter_getx_app/page/counter/counter_controller.dart';
import 'package:flutter_getx_app/utils/app_names.dart';
import 'package:get/get.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});
  final controller = Get.put<CounterController>(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppNames.other);
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Obx(() => Text(
              controller.count.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            )),
      )),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              controller.decrement();
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              controller.increment();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
