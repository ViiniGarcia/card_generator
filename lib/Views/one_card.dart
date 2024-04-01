import 'package:card_generator/Classes/card.dart';
import 'package:card_generator/Views/view_card.dart';
import 'package:flutter/material.dart';

typedef FormCallback = Null Function(String nameController,
    String nicknameController, String squadSelectedController);

class OneCard extends StatefulWidget {
  const OneCard({super.key});

  @override
  State<OneCard> createState() => _OneCardState();
}

class _OneCardState extends State<OneCard> {
  late CardEJC card;
  final List<CardEJC> listCard = [];
  String name = '';
  String nickname = '';
  String squadSelected = '';
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
                  child: FormOneCard(
                    formCallback: (nameController, nicknameController,
                        squadSelectedController) {
                      setState(() {
                        listCard.clear();
                        listCard.add(CardEJC(
                            name: nameController,
                            nickname: nicknameController,
                            squad: squadSelectedController));
                      });
                      if (!isLargeScreen) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ViewCardPage(
                            listCards: listCard,
                          );
                        }));
                      }
                    },
                  )),
              isLargeScreen
                  ? Expanded(
                      flex: 7,
                      child: ViewCard(
                        listCards: listCard,
                      ))
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}

//Widget Form One Card
class FormOneCard extends StatefulWidget {
  final FormCallback formCallback;

  FormOneCard({super.key, required this.formCallback});

  @override
  State<FormOneCard> createState() => _FormOneCardState();
}

class _FormOneCardState extends State<FormOneCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final dropdownMenuItens = const [
    DropdownMenuEntry(value: 'Bomboniere', label: 'Bomboniere'),
    DropdownMenuEntry(value: 'Café', label: 'Café'),
    DropdownMenuEntry(value: 'Circulo', label: 'Circulo'),
    DropdownMenuEntry(value: 'Compras', label: 'Compras'),
    DropdownMenuEntry(value: 'Cozinha', label: 'Dirigentes'),
    DropdownMenuEntry(value: 'Gerais', label: 'Gerais'),
    DropdownMenuEntry(value: 'Liturgia', label: 'Liturgia'),
    DropdownMenuEntry(value: 'Ordem', label: 'Ordem'),
    DropdownMenuEntry(value: 'Pascom', label: 'Pascom'),
    DropdownMenuEntry(value: 'Patrimônio', label: 'Patrimônio'),
    DropdownMenuEntry(value: 'Reflexão', label: 'Reflexão'),
    DropdownMenuEntry(value: 'Regras', label: 'Regras'),
    DropdownMenuEntry(value: 'Sala', label: 'Sala'),
    DropdownMenuEntry(value: 'Teatro', label: 'Teatro'),
  ];

  final squadSelectedController = TextEditingController();
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownMenu(
              label: const Text('Selecione a equipe ou circulo'),
              enableSearch: true,
              leadingIcon: const Icon(Icons.search),
              dropdownMenuEntries: dropdownMenuItens,
              expandedInsets: const EdgeInsets.all(10),
              menuHeight: MediaQuery.of(context).size.height * 0.3,
              controller: squadSelectedController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Nome completo',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Digite o nome completo';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormField(
              controller: nicknameController,
              decoration: const InputDecoration(
                hintText: 'Apelido',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Digite o apelido';
                }
                return null;
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    squadSelectedController.text != '') {
                  widget.formCallback(nameController.text,
                      nicknameController.text, squadSelectedController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text('Preencha todos os campos!'),
                    ),
                  );
                }
              },
              child: const Text('Gerar crachá'),
            ),
          ],
        ),
      ),
    );
  }
}
