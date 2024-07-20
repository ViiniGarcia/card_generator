import 'package:card_generator/Classes/badge.dart';
import 'package:card_generator/Utils/extensions.dart';
import 'package:card_generator/Views/view_badge.dart';
import 'package:flutter/material.dart';

typedef FormCallback = Null Function(String nameController,
    String nicknameController, String squadSelectedController);

class OneBadge extends StatefulWidget {
  const OneBadge({super.key});

  @override
  State<OneBadge> createState() => _OneBadgeState();
}

class _OneBadgeState extends State<OneBadge> {
  late BadgeEJC badge;
  final List<BadgeEJC> listBadge = [];
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
                  child: FormOneBadge(
                    formCallback: (nameController, nicknameController,
                        squadSelectedController) {
                      setState(() {
                        listBadge.clear();
                        listBadge.add(BadgeEJC(
                          name: nameController.toUpperCase().nameAbbreviation(),
                          nickname: nicknameController.toUpperCase(),
                          squad: squadSelectedController.removeSpecialCaracters()));
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

//Widget Form One Badge
class FormOneBadge extends StatefulWidget {
  final FormCallback formCallback;

  const FormOneBadge({super.key, required this.formCallback});

  @override
  State<FormOneBadge> createState() => _FormOneBadgeState();
}

class _FormOneBadgeState extends State<FormOneBadge> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final dropdownMenuItens = const [
    DropdownMenuEntry(value: 'Bomboniere', label: 'Bomboniere'),
    DropdownMenuEntry(value: 'Cafe', label: 'Café'),
    DropdownMenuEntry(value: 'Circulo', label: 'Circulo'),
    DropdownMenuEntry(value: 'Compras', label: 'Compras'),
    DropdownMenuEntry(value: 'Cozinha', label: 'Cozinha'),
    DropdownMenuEntry(value: 'Dirigentes', label: 'Dirigentes'),
    DropdownMenuEntry(value: 'Gerais', label: 'Gerais'),
    DropdownMenuEntry(value: 'Liturgia', label: 'Liturgia'),
    DropdownMenuEntry(value: 'Ordem', label: 'Ordem'),
    DropdownMenuEntry(value: 'Pascom', label: 'Pascom'),
    DropdownMenuEntry(value: 'Reflexao', label: 'Reflexão'),
    DropdownMenuEntry(value: 'Regras', label: 'Regras'),
    DropdownMenuEntry(value: 'Sala', label: 'Sala'),
    DropdownMenuEntry(value: 'Teatro', label: 'Teatro'),
    DropdownMenuEntry(value: 'Visitacao', label: 'Visitação'),
    DropdownMenuEntry(value: 'Carlo Acutis', label: 'Carlo Acutis'),
    DropdownMenuEntry(value: 'Nossa Senhora Aparecida', label: 'Nossa Senhora Aparecida'),
    DropdownMenuEntry(value: 'Santo Agostinho', label: 'Santo Agostinho'),
    DropdownMenuEntry(value: 'Santo Antônio', label: 'Santo Antônio'),
    DropdownMenuEntry(value: 'São João Paulo ll', label: 'São João Paulo ll'),
    DropdownMenuEntry(value: 'São Padre Pio', label: 'São Padre Pio'),
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
