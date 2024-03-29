import 'package:card_generator/Utils/functions.dart';
import 'package:flutter/material.dart';

class PrintableTest extends StatelessWidget {
  const PrintableTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          printDoc();
        },
         child: const Text('Print'),
      ),
    );
  }
}