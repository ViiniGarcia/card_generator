import 'package:card_generator/Utils/functions.dart';
import 'package:flutter/material.dart';


class OneCardForm extends StatefulWidget {
  const OneCardForm({super.key});

  @override
  State<OneCardForm> createState() => _OneCardFormState();
}

class _OneCardFormState extends State<OneCardForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Teste upload',
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                pickerExcelFile();
              });
            },
            child: const Text('Upload')
          ),
        ],
      ),
    );
  }
}