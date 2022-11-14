import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_getx_app/page/other/other_controller.dart';
import 'package:get/get.dart';

class OtherView extends GetView<OtherController> {
  const OtherView({super.key});

  @override
  Widget build(BuildContext context) {
    log('BUILD');
    return Scaffold(
      appBar: AppBar(
        title: Text('hi'.tr),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.local_activity))
        ],
      ),
      body: SafeArea(
          child: Center(
        child: GetBuilder(
            init: controller,
            builder: (_) {
              return Text(
                controller.count.toString(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              );
            }),
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
              controller.inrement();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
