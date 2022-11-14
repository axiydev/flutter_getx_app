import 'dart:developer';

import 'package:flutter_getx_app/data/dataprovider/quote_api.dart';
import 'package:flutter_getx_app/data/repository/quote_repository.dart';
import 'package:flutter_getx_app/service/prefs.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  late final QuoteApiRepository apiRepository;
  final prefs = Get.find<GetPrefs>();
  final arguments = Get.arguments;

  late final id;

  @override
  void onInit() {
    id = arguments['id'];
    apiRepository = QuoteApiRepository(quoteApi: QuoteApi());
    super.onInit();
  }

  void backToQuote() async {
    try {
      final isDeletedAuthor = await prefs.removeData(key: 'author');
      final isDeletedQuote = await prefs.removeData(key: 'quote');
      if (isDeletedAuthor! && isDeletedQuote!) {
        Get.back();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
