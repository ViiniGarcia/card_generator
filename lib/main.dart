import 'package:card_generator/Views/home.dart';
import 'package:card_generator/Views/one_card.dart';
import 'package:card_generator/Views/print_test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cards Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeCardsGenerator(),//const PrintableTest(),//const MyHomePage(title: 'Gerador de crachás EJC'),
    );
  }
}