import 'package:card_generator/Classes/badge.dart';
import 'package:card_generator/Utils/functions.dart';
import 'package:flutter/material.dart';

class ManyBadges extends StatefulWidget {
  const ManyBadges({super.key});

  @override
  State<ManyBadges> createState() => _ManyBadgesState();
}

class _ManyBadgesState extends State<ManyBadges> {

  TypeBadge? _typeBadge = TypeBadge.Encontreiro;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Selecione o tipo do crachá:'),
          RadioListTile<TypeBadge>(
            title: const Text('Encontreiro'),
            value: TypeBadge.Encontreiro,
            groupValue: _typeBadge,
            onChanged: (TypeBadge? value) {
              setState(() {
                _typeBadge = value;
              });
            },
          ),
          RadioListTile<TypeBadge>(
            title: const Text('Encontrista'),
            value: TypeBadge.Encontrista,
            groupValue: _typeBadge,
            onChanged: (TypeBadge? value) {
              setState(() {
                _typeBadge = value;
              });
            },
          ),
          const Text('Insira um arquivo excel que contenha os dados para criação dos crachás'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: (){
              pickerExcelFile();
            }, 
            child: const Text('Importar arquivo'),
          ),
        ],
      ),
    );
  }
}