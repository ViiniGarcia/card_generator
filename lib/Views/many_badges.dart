import 'package:card_generator/Classes/badge.dart';
import 'package:card_generator/Utils/functions.dart';
import 'package:card_generator/Views/view_badge.dart';
import 'package:flutter/material.dart';

typedef ExcelCallback = Null Function(List<BadgeEJC> listBadgesController);

class ManyBadges extends StatefulWidget {
  const ManyBadges({super.key});

  @override
  State<ManyBadges> createState() => _ManyBadgesState();
}

class _ManyBadgesState extends State<ManyBadges> {
  List<BadgeEJC> listBadge = [];
  bool isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (MediaQuery.of(context).size.width > 1000) {
            isLargeScreen = true;
          } else {
            isLargeScreen = false;
          }
          return Row(
            children: [
              Expanded(
                  flex: 3,
                  child: FormManyBadges(
                    excelCallback: (listBadgesController) {
                      setState(() {
                        listBadge = listBadgesController;
                      });
                      if (!isLargeScreen) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ViewBadgePage(
                            listBadges: listBadge,
                          );
                        }));
                      }
                    },
                  )),
              isLargeScreen
                  ? const VerticalDivider(
                      width: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 0,
                      color: Colors.grey,
                    )
                  : Container(),
              isLargeScreen
                  ? Expanded(
                      flex: 7,
                      child: ViewBadgePage(
                        listBadges: listBadge,
                      ))
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}

//Widget Form Many Badges
class FormManyBadges extends StatefulWidget {
  final ExcelCallback excelCallback;

  const FormManyBadges({super.key, required this.excelCallback});

  @override
  State<FormManyBadges> createState() => _FormManyBadgesState();
}

class _FormManyBadgesState extends State<FormManyBadges> {

  TypeBadge? _typeBadge = TypeBadge.Encontreiro;
  List<BadgeEJC> listBadges = [];

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
            onPressed: () async {
              var returnList = await pickerExcelFile();
              setState((){
                listBadges = returnList;
              });
              widget.excelCallback(listBadges);
            }, 
            child: const Text('Importar arquivo'),
          ),
        ],
      ),
    );
  }
}