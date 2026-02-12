import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/elenco_room.dart';
import './card_room.dart';

class Carosello extends StatefulWidget {
  const Carosello({super.key});

  @override
  State<Carosello> createState() => _CaroselloState();
}

class _CaroselloState extends State<Carosello> {

  final CarouselController _controller = CarouselController(initialItem: 1);
  int _currentIndex = 1;

  // scorre il carrello in una direzione
  void _scorriCarosello(int direzione) {

    int newIndex = _currentIndex + direzione;

    // controllo per non sforare
    if (newIndex >= 0 && newIndex < gestoreRooms.listaRooms.length) {

      setState(() { _currentIndex = newIndex; });

      // animazione carosello
      _controller.animateToItem(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    // impostazioni schermo
    double screenWidth = MediaQuery.sizeOf(context).width;

    double fontTesto1 = (screenWidth * 0.0333);
    double fontTesto2 = (screenWidth * 0.01);
    double altezzaBoxTesto = (screenWidth * 0.10);
    int flexTesto = screenWidth > 1000 ? 1 : 2;

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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              //testi in alto
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // testo a sinistra
                  Expanded(
                    flex: flexTesto,
                    child: SizedBox(
                      height: altezzaBoxTesto,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Our top-rated and highly visited hotel",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: fontTesto1,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ),
                  ),

                  const Spacer(flex: 1),

                  // testo a destra
                  Expanded(
                    flex: flexTesto,
                    child: SizedBox(
                      height: altezzaBoxTesto,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Discover our handpicked selection of the year's finest hotels. Curated based on feedback from our delighted visitors",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: fontTesto2,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // carosello con freccie
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    // in caso di scroll aggiorna _currentIndex (raramente scorre di 2)
                    NotificationListener<ScrollUpdateNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.maxScrollExtent > 0) {

                          double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
                          double rawIndex = progress * (gestoreRooms.listaRooms.length - 1);

                          int newIndex = rawIndex.floor();
                          newIndex = newIndex.clamp(0, gestoreRooms.listaRooms.length - 1);

                          if (newIndex != _currentIndex) {
                            setState(() { _currentIndex = newIndex; });
                          }
                        }
                        return false;
                      },

                      // carosello
                      child: CarouselView.weighted(
                        controller: _controller,
                        itemSnapping: true,
                        flexWeights: const <int>[1, 2, 1],
                        onTap: (int index) {
                          if (kDebugMode) { print('✅ Cliccato indice $index'); }
                        },
                        children: gestoreRooms.listaRooms.map((room) => CardRoom(room: room)).toList(),
                      ),
                    ),

                    // freccia sinistra
                    Positioned(
                      left: 0,
                      child: _buildFreccia(
                        icon: Icons.arrow_back_ios_new,
                        onTap: () => _scorriCarosello(-1),
                        isEnabled: _currentIndex > 0,
                      ),
                    ),

                    // freccia destra
                    Positioned(
                      right: 0,
                      child: _buildFreccia(
                        icon: Icons.arrow_forward_ios,
                        onTap: () => _scorriCarosello(1),
                        isEnabled: _currentIndex < gestoreRooms.listaRooms.length - 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // costruisce la freccia del carosello
  Widget _buildFreccia({required IconData icon, required VoidCallback onTap, required bool isEnabled}) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: isEnabled ? onTap : null,
        borderRadius: BorderRadius.circular(50),

        child: Container(
          width: 30,
          height: 30,

          decoration: BoxDecoration(
            color: isEnabled ? Colors.white : Colors.white70,
            shape: BoxShape.circle,
            boxShadow: [
              if (isEnabled)
                const BoxShadow(
                    color: Colors.black38,
                    blurRadius: 2,
                    spreadRadius: 1
                ),
            ],
          ),

          child: Icon(
              icon,
              color: isEnabled ? Colors.black : Colors.grey,
              size: 10
          ),
        ),
      ),
    );
  }
}