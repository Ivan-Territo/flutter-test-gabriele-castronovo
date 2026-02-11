import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/elenco_room.dart';
import './card_room.dart';

class Carosello extends StatelessWidget {

  final CarouselController _controller = CarouselController(initialItem: 1);

  Carosello({ super.key });

  @override
  Widget build(BuildContext context) {

    // grandezza schermo
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Expanded(
      child: Container(

        // decorazione
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),

        // contenuto
        child: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              // testi in alto
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // testo a sinistra
                  Expanded(
                    flex: 4,
                    child: Padding (
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Our top-rated and highly visited hotel",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: screenWidth > 600 ? 34 : 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ),

                  const Spacer(flex: 4),

                  // testo a destra
                  Expanded(
                    flex: 4,
                    child: Padding (
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Discover our handpicked selection of the year's finest hotels. Curated based on feedback from our delighted visitors",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: screenWidth > 600 ? 12 : 6,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  )
                ],
              ),

              // carosello
              Expanded(
                child: CarouselView.weighted(
                  controller: _controller,
                  itemSnapping: true,
                  flexWeights: const <int>[1, 2, 1],
                  onTap: (int index) {
                    if (kDebugMode) { print('✅ Cliccato'); }
                  },
                  children: gestoreRooms.listaRooms.map((room) => CardRoom(room: room)).toList(),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
