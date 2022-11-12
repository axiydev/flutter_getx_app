import 'package:flutter/material.dart';
import 'package:flutter_getx_app/data/dataprovider/quote_api.dart';
import 'package:flutter_getx_app/data/repository/quote_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class QuoteController extends GetxController {
  late final QuoteApiRepository quoteRepository;
  List<Color?> colorList = [
    Colors.amber,
    Colors.cyan,
    Colors.green,
    Colors.limeAccent
  ];
  @override
  void onInit() {
    quoteRepository = QuoteApiRepository(quoteApi: QuoteApi());
    super.onInit();
  }
}
