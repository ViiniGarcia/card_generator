import 'package:card_generator/Views/one_card.dart';
import 'package:flutter/material.dart';

class HomeCardsGenerator extends StatefulWidget {
  const HomeCardsGenerator
({super.key});

  @override
  State<HomeCardsGenerator> createState() => _HomeCardsGeneratorState();
}

class _HomeCardsGeneratorState extends State<HomeCardsGenerator> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gerador de crachás EJC'),
      ),
      body: [
        const OneCard(),
        const OneCard()
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Um crachá',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outlined),
            selectedIcon: Icon(Icons.people),
            label: 'Vários crachás'
          ),
        ],
      ),
    );
  }
}