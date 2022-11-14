import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getx_app/page/quote/quote_controller.dart';
import 'package:get/get.dart';

class QuoteWidget extends StatelessWidget {
  QuoteWidget({super.key});
  final controller = Get.put(QuoteController());
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
