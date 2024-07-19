import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      title: 'Barcode scanner',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: true,
      home: const HomePage(),
    );
  }
}
