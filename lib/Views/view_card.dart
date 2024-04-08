import 'package:card_generator/Classes/card.dart';
import 'package:card_generator/Utils/functions.dart';
import 'package:flutter/material.dart';

class ViewCardPage extends StatelessWidget {
  final List<CardEJC> listCards;

  const ViewCardPage({super.key, required this.listCards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                printDoc(listCards);
              },
              icon: const Icon(Icons.print),
              label: const Text('Imprimir')),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          )
        ],
      ),
      body: ViewCard(
        listCards: listCards,
      ),
    );
  }
}

class ViewCard extends StatelessWidget {
  final List<CardEJC> listCards;

  const ViewCard({super.key, required this.listCards});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.02, 0,
          MediaQuery.of(context).size.width * 0.02, 0),
      child: GridView.builder(
          itemCount: listCards.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.height * 0.2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 378 / 265,
          ),
          itemBuilder: (BuildContext context, index) {
            if (listCards.isEmpty) {
              return Container();
            } else {
              //tamanho do cracha 265px / 378px
              return Container(
                width: 378,
                height: 265,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("lib/Assets/testCard.jpg").image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Text(listCards[index].name),
                    Text(listCards[index].nickname),
                    Text(listCards[index].squad),
                  ],
                )
              );
            }
          }),
    );
  }
}
