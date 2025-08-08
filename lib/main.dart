import 'package:flutter/material.dart';
import 'package:flutter_application_1/currency_converter/currency_converter.dart';

void main() => runApp(MyApp());
//Needs a class as Input
//needs directionality widget..classes like Text cannot be directly implemented

//Types of Widgets
//1. Stateless Widget - Constant Values(No Real World application) Data Immutable
//2. StatefulWidget - Variable values Data Mutable
//3. InheritedWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}