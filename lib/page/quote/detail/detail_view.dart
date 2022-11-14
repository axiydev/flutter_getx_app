import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_app/data/model/quote_model.dart';
import 'package:flutter_getx_app/page/quote/detail/detail_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailView extends GetWidget<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.backToQuote,
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          GetBuilder(
              init: controller,
              builder: (_) {
                return TextButton(
                    onPressed: () {},
                    child: Text(
                      controller.id.toString(),
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ));
              })
        ],
        title: GetBuilder(
            init: controller,
            builder: (_) {
              return FutureBuilder<String?>(
                  initialData: '',
                  future: controller.prefs
                      .loadDataFromStorage<String>(key: 'author'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CupertinoActivityIndicator();
                    }

                    if (!snapshot.hasData || snapshot.hasError) {
                      return const Text('Your app has an error');
                    }

                    return Text(snapshot.data ?? 'author');
                  });
            }),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Get Storage'),
            GetBuilder(
                init: controller,
                builder: (_) {
                  return FutureBuilder<String?>(
                      initialData: '',
                      future: controller.prefs
                          .loadDataFromStorage<String>(key: 'quote'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CupertinoActivityIndicator();
                        }

                        if (!snapshot.hasData || snapshot.hasError) {
                          return const Text('Your app has an error');
                        }

                        return Text(snapshot.data ?? 'quote');
                      });
                }),
            const Text('Quote Repository'),
            GetBuilder(
                init: controller,
                builder: (_) {
                  return FutureBuilder<Quote?>(
                      initialData: Quote.fromJson({}),
                      future: controller.apiRepository
                          .getSingleQuote(id: controller.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CupertinoActivityIndicator();
                        }

                        if (!snapshot.hasData || snapshot.hasError) {
                          return const Text('Your app has an error');
                        }

                        return Text(snapshot.data!.quote ?? 'quote');
                      });
                }),
          ],
        ),
      ),
    );
  }
}
