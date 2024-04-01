import 'package:flutter/material.dart';

class OneCard extends StatefulWidget {
  const OneCard({super.key});

  @override
  State<OneCard> createState() => _OneCardState();
}

class _OneCardState extends State<OneCard> {
  void teste() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (MediaQuery.of(context).size.width > 1000) {
            return const Row(
              children: [
                Expanded(flex: 3, child: FormOneCard()),
                Expanded(
                    flex: 7,
                    child: Center(
                      child: Text('teste'),
                    ))
              ],
            );
          } else {
            return const Expanded(child: FormOneCard());
          }
        },
      ),
    );
  }
}

//Widget Form One Card
class FormOneCard extends StatefulWidget {
  const FormOneCard({super.key});

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
  final  squadSelected = TextEditingController();
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
              controller: squadSelected,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TextFormField(
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
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate() &&
                    squadSelected.text != '') {
                  print(squadSelected.text);
                  print(nameController.text);
                  print(nicknameController.text);
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


// onSelected: (squad) {
//                 if (squad != null) {
//                   setState(() {
//                     _squadSelected = squad;
//                   });
//                 }
//               },