import 'package:flutter/material.dart';
import 'package:flutter_getx_app/page/quote/quote_binding.dart';
import 'package:flutter_getx_app/utils/app_names.dart';
import 'package:flutter_getx_app/utils/app_pages.dart';
import 'package:flutter_getx_app/utils/localization/app_localiztion.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';

/*
Created by Axmadjon Isaqov on 11:50:43 12.11.2022
© 2022 @axi_dev 
*/
/*
Theme:::Getx example
*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      translations: AppLocalization(),
      supportedLocales: const [Locale('uz', 'UZ'), Locale('en', 'GB')],
      fallbackLocale: const Locale('en', 'GB'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.native,
      getPages: appPages,
      initialBinding: QuoteBinding(),
      initialRoute: AppNames.quote,
    );
  }
}
