import 'package:card_generator/Classes/badge.dart';
import 'package:card_generator/Utils/functions.dart';
import 'package:flutter/material.dart';

class ViewBadgePage extends StatelessWidget {
  final List<BadgeEJC> listBadges;

  const ViewBadgePage({super.key, required this.listBadges});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                printDoc(listBadges);
              },
              icon: const Icon(Icons.print),
              label: const Text('Imprimir')),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          )
        ],
      ),
      body: ViewBadge(
        listBadges: listBadges,
      ),
    );
  }
}

class ViewBadge extends StatelessWidget {
  final List<BadgeEJC> listBadges;

  const ViewBadge({super.key, required this.listBadges});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.02, 0,
          MediaQuery.of(context).size.width * 0.02, 0),
      child: GridView.builder(
          itemCount: listBadges.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.height * 0.2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 378 / 265,
          ),
          itemBuilder: (BuildContext context, index) {
            if (listBadges.isEmpty) {
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
                    Text(listBadges[index].name),
                    Text(listBadges[index].nickname),
                    Text(listBadges[index].squad),
                  ],
                )
              );
            }
          }),
    );
  }
}
