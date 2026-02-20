import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vangti_chai/screens/calculator.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}


