import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malath_sara/app_pages.dart';
main() {
  runApp(const MalathApp());
}

class MalathApp extends StatelessWidget {
  const MalathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.homePatientsPage,
      getPages: AppPages.appPages,
    );
  }

}