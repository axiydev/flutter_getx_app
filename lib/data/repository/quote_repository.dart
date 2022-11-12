import 'dart:developer';
import 'package:flutter_getx_app/data/dataprovider/quote_api.dart';
import 'package:flutter_getx_app/data/model/quote_model.dart';
import 'package:flutter_getx_app/data/model/quote_wrapper.dart';

class QuoteApiRepository {
  late final QuoteApi quoteApi;
  QuoteApiRepository({required this.quoteApi});

  Future<List<Quote?>?> getQuotes() async {
    try {
      final QuoteWrapper quoteWrapper = await quoteApi.getQuoteWrapper();

      final quotes = quoteWrapper.quotes;
      return quotes;
    } catch (e) {
      log(e.toString());
    }
    return List.empty();
  }
}
