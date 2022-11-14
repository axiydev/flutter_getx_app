import 'package:flutter/material.dart';
import 'package:flutter_getx_app/page/quote/quote_binding.dart';
import 'package:flutter_getx_app/service/prefs.dart';
import 'package:flutter_getx_app/utils/app_names.dart';
import 'package:flutter_getx_app/utils/app_pages.dart';
import 'package:flutter_getx_app/utils/localization/app_localiztion.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/*
Created by Axmadjon Isaqov on 11:50:43 12.11.2022
© 2022 @axi_dev 
*/

/*
Theme:::Getx example
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  try {
    Get.put(GetPrefs.init());
  } catch (e) {
    debugPrint(e.toString());
  }
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
