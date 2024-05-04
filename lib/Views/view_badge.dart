import 'package:card_generator/Classes/badge.dart';
import 'package:card_generator/Utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OffsetCallback = Null Function(Offset posNameCallback,
    Offset posNickCallback, Offset posSquadCallback);

class ViewBadgePage extends StatefulWidget {
  final List<BadgeEJC> listBadges;

  const ViewBadgePage({super.key, required this.listBadges});

  @override
  State<ViewBadgePage> createState() => _ViewBadgePageState();
}

class _ViewBadgePageState extends State<ViewBadgePage> {

  late Offset posName;
  late Offset posNick;
  late Offset posSquad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                printDoc(widget.listBadges, posName);
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
        offsetCallback: (Offset posNameCallback, Offset posNickCallback, Offset posSquadCallback) {
          setState(() {
            posName = posNameCallback;
            posNick = posNickCallback;
            posSquad = posSquadCallback;
          });
        },
      ),
    );
  }
}

class ViewBadge extends StatefulWidget {
  final List<BadgeEJC> listBadges;
  final OffsetCallback offsetCallback;

  const ViewBadge({super.key, required this.listBadges, required this.offsetCallback});

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
            maxCrossAxisExtent: MediaQuery.of(context).size.height * 0.2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 210 / 298,
          ),
          itemBuilder: (BuildContext context, index) {
            if (widget.listBadges.isEmpty) {
              return Container();
            } else {
              //tamanho do cracha 378px / 265px
              //tamanho cracha credencial 210px / 298px
              return Container(
                width: 210,
                height: 298,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("assets/testeCredential.jpg").image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  //fit: StackFit.expand,
                  children: [
                    Positioned(
                      left: posName.dx,
                      top: posName.dy,
                      child: 
                        GestureDetector(
                          onPanUpdate: (details){
                            setState(() {
                              posName = Offset(posName.dx + details.delta.dx, posName.dy + details.delta.dy);
                            });
                            widget.offsetCallback(posName, posNick, posSquad);
                          },
                          child: Text(
                            widget.listBadges[index].name,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            ),
                        )
                      ),
                    // Positioned(
                    //   left: posNick.dx,
                    //   top: posNick.dy,
                    //   child: 
                    //     GestureDetector(
                    //       onPanUpdate: (details){
                    //         setState(() {
                    //           posNick = Offset(posNick.dx + details.delta.dx, posNick.dy + details.delta.dy);
                    //         });
                    //         widget.offsetCallback(posName, posNick, posSquad);
                    //       },
                    //       child: Text(widget.listBadges[index].nickname),
                    //     )
                    //   ),
                    // Positioned(
                    //   left: posSquad.dx,
                    //   top: posSquad.dy,
                    //   child: 
                    //     GestureDetector(
                    //       onPanUpdate: (details){
                    //         setState(() {
                    //           posSquad = Offset(posSquad.dx + details.delta.dx, posSquad.dy + details.delta.dy);
                    //         });
                    //         widget.offsetCallback(posName, posNick, posSquad);
                    //       },
                    //       child: Text(widget.listBadges[index].squad),
                    //     )
                    //   ),
                  ],
                )
              );
            }
          }),
    );
  }
}
