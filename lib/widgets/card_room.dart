import 'package:flutter/material.dart';
import '../models/room.dart';

class CardRoom extends StatelessWidget {
  final Room room;

  const CardRoom({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: room.id,
      child: Material(
        type: MaterialType.transparency,
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [

                // immagine
                if (room.urlImmagine != null && room.urlImmagine!.isNotEmpty)
                  Positioned.fill(
                    child: Image.network(
                      room.urlImmagine!,
                      fit: BoxFit.cover,

                      // errore caricamento
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.broken_image_outlined,
                          size: 120,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  )
                else
                  // errore immagine
                  const Positioned.fill(
                    child: Center(
                      child: Icon(Icons.image_not_supported, size: 120),
                    ),
                  ),

                // gradiente per poter leggere meglio il testo in basso
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.7),
                        ],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),
                ),

                // testo in basso a sinistra
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      room.nomeStanza ?? "",
                      style: TextStyle(),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
