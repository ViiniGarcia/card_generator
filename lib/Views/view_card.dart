import 'package:card_generator/Classes/card.dart';
import 'package:flutter/material.dart';

class ViewCardPage extends StatelessWidget {
  final List<CardEJC> listCards;

  const ViewCardPage({super.key, required this.listCards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ViewCard(listCards: listCards,),
    );
  }
}

class ViewCard extends StatelessWidget {
  final List<CardEJC> listCards;

  const ViewCard({super.key, required this.listCards});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text('Nome: ${listCards[0].name}'),
        Text('Nickname: ${listCards[0].nickname}'),
        Text('Squad: ${listCards[0].squad}')
      ]),
    );
  }
}
