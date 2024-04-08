import 'package:card_generator/Views/one_badge.dart';
import 'package:flutter/material.dart';

class HomeBadgesGenerator extends StatefulWidget {
  const HomeBadgesGenerator
({super.key});

  @override
  State<HomeBadgesGenerator> createState() => _HomeBadgesGeneratorState();
}

class _HomeBadgesGeneratorState extends State<HomeBadgesGenerator> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gerador de crachás EJC'),
      ),
      body: [
        const OneBadge(),
        const OneBadge()
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