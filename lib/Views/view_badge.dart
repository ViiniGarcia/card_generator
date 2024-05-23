import 'package:card_generator/Classes/badge.dart';
import 'package:card_generator/Utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewBadgePage extends StatefulWidget {
  final List<BadgeEJC> listBadges;

  const ViewBadgePage({super.key, required this.listBadges});

  @override
  State<ViewBadgePage> createState() => _ViewBadgePageState();
}

class _ViewBadgePageState extends State<ViewBadgePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                printDoc(widget.listBadges);
              },
              icon: const Icon(Icons.print),
              label: const Text('Imprimir')),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          )
        ],
      ),
      body: ViewBadge(
        listBadges: widget.listBadges, 
      ),
    );
  }
}

class ViewBadge extends StatefulWidget {
  final List<BadgeEJC> listBadges;

  const ViewBadge({super.key, required this.listBadges});

  @override
  State<ViewBadge> createState() => _ViewBadgeState();
}

class _ViewBadgeState extends State<ViewBadge> {
  Offset posName = Offset.zero;
  Offset posNick = Offset.zero;
  Offset posSquad = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.02, 0,
          MediaQuery.of(context).size.width * 0.02, 0),
      child: GridView.builder(
          itemCount: widget.listBadges.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.2,
            //maxCrossAxisExtent: 400,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1000 / 1500,
          ),
          itemBuilder: (BuildContext context, index) {
            if (widget.listBadges.isEmpty) {
              return Container();
            } else {
              return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.width * 0.04),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("assets/Regras.jpg").image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.listBadges[index].nickname,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      widget.listBadges[index].name,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
