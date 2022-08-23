import 'package:demo/database/mydatabase.dart';
import 'package:demo/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late MyDatabase myDatabase;
void main() {
  myDatabase = MyDatabase();
  runApp(const MyDemoCURD());
}

class MyDemoCURD extends StatelessWidget {
  const MyDemoCURD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
