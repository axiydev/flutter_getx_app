import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_getx_app/data/model/quote_model.dart';
import 'package:flutter_getx_app/data/model/quote_wrapper.dart';

class QuoteApi {
  Dio? dio;
  QuoteApi()
      : dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'))
          ..interceptors.addAll([
            AppInterceptor(),
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore()))
          ]);

  Future<QuoteWrapper> getQuoteWrapper() async {
    late final Response<Map<String, dynamic>> getWrapperResponse;
    try {
      getWrapperResponse =
          await dio!.getUri<Map<String, dynamic>>(Uri.tryParse('/quotes')!);

      if (getWrapperResponse.statusCode == 200) {
        return QuoteWrapper.fromJson(getWrapperResponse.data!);
      }
      return QuoteWrapper.fromJson({});
    } on DioError catch (e) {
      log(e.toString());
      log('Dio ERRorr');
    } catch (e) {
      log(e.toString());
    }
    return QuoteWrapper.fromJson({});
  }

  Future<Quote> getSingleQuote({required int id}) async {
    late final Response<Map<String, dynamic>> quoteResponse;

    try {
      quoteResponse =
          await dio!.getUri<Map<String, dynamic>>(Uri.tryParse('/quotes/$id')!);

      if (quoteResponse.statusCode == 200) {
        return Quote.fromJson(quoteResponse.data!);
      }
    } on DioError {
      log('DIO ERROR');
    } catch (e) {
      log(e.toString());
    }
    return Quote.fromJson({});
  }
}

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({'Content-Type': "application/json; charset=utf-8"});
    super.onRequest(options, handler);
  }
}
