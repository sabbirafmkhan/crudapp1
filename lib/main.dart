import 'package:crudapp1/screens/ProductCreateScreen.dart';
import 'package:crudapp1/screens/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        appBarTheme: AppBarTheme(
          color: Colors.green,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      home: ProductGridViewScreen(),
    );
  }
}
