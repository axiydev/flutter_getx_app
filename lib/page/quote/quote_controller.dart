import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getx_app/data/dataprovider/quote_api.dart';
import 'package:flutter_getx_app/data/model/quote_model.dart';
import 'package:flutter_getx_app/data/repository/quote_repository.dart';
import 'package:flutter_getx_app/service/prefs.dart';
import 'package:flutter_getx_app/utils/app_names.dart';
import 'package:get/get.dart';

class QuoteController extends GetxController {
  final prefs = Get.find<GetPrefs>();
  late final QuoteApiRepository quoteRepository;
  List<Color?> colorList = [
    Colors.amber,
    Colors.cyan,
    Colors.green,
    Colors.limeAccent
  ];

  void saveDataToDb({required Quote quote}) async {
    try {
      final isSavedAuthor =
          await prefs.saveData<String>(key: 'author', data: quote.author!);
      final isSavedQuote =
          await prefs.saveData<String>(key: 'quote', data: quote.quote!);
      if (isSavedAuthor! && isSavedQuote!) {
        Get.toNamed(AppNames.quoteDetail, arguments: {'id': quote.id});
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void changeLocal() {
    if (Get.locale == const Locale('uz', 'UZ')) {
      Get.updateLocale(const Locale('en', 'GB'));
    } else {
      Get.updateLocale(const Locale('uz', 'UZ'));
    }
  }

  @override
  void onInit() {
    quoteRepository = QuoteApiRepository(quoteApi: QuoteApi());
    log('INITED');
    super.onInit();
  }
}
