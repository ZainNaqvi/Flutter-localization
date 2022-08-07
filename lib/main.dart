import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:languages_localization/localization_service.dart';
import 'package:languages_localization/t_key.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      init: localizationController,
        builder: (LocalizationController controller){
          return MaterialApp(
            title: 'Flutter Localization Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            locale: controller.currentLanguage != ''
                ? Locale(controller.currentLanguage, '')
                : null,
            localeResolutionCallback: LocalizationService.localeResolutionCallBack,
            supportedLocales: LocalizationService.supportedLocales,
            localizationsDelegates: LocalizationService.localizationsDelegate,
            home: MyHomePage(title: 'Flutter Localization'),
          );
        }
    );
  }
}

class MyHomePage extends StatelessWidget {

  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final localizationController = Get.find<LocalizationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TKeys.hello.translate(context),
              style: const TextStyle(fontSize: 42),),
            const SizedBox(height: 20,),
            Text(
              TKeys.info.translate(context),
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  localizationController.toggleLanguage();
                },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    TKeys.changeLanguage.translate(context),
                    style: const TextStyle(fontSize: 18)),
              ))
          ],
        ),
      ),
    );
  }
}

