import 'package:flutter/material.dart';
import '../models/room.dart';

class DettagliRoom extends StatelessWidget {

  final Room room;

  const DettagliRoom({
    super.key,
    required this.room
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[50],
      body: SafeArea(

        child:
        CustomScrollView(
          slivers: [

            // barra in alto
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,

              // nome
              title: Text(
                room.nomeStanza ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),

              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: room.id,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.teal),

                    child: Stack(
                      alignment: Alignment.center,
                      children: [

                        // controllo: nessuna immagine
                        if (room.urlImmagine == null || room.urlImmagine!.isEmpty)
                          const Icon(
                            Icons.folder_open_rounded,
                            size: 120,
                            color: Colors.white70,
                          )

                        else
                        // immagine
                          Image.network(
                            room.urlImmagine!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,

                            // errore caricamento
                            errorBuilder: (context, error, stack) => const Icon(
                              Icons.broken_image_outlined,
                              size: 120,
                              color: Colors.white70,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // attributi room
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),

                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // nome
                        Expanded(
                          child: Text(
                            room.nomeStanza ?? "",
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),

                        // preszzo
                        Text(
                          "${room.prezzoNotte ?? 0}€",
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // tipologia
                    Text(
                      "${room.tipologia ?? ''}  •  ${room.postiLetto ?? 1} Posti letto",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 20),

                    // disponibilità
                    Row(
                      children: [
                        Icon(
                          room.disponibile == true ? Icons.check_circle : Icons.cancel,
                          color: room.disponibile == true ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          room.disponibile == true ? "Attualmente Disponibile" : "Non Disponibile",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // lista servizi
                    _buildServizi (
                      aperta: true,
                      children: [
                        if (room.servizi != null && room.servizi!.isNotEmpty)

                          ...room.servizi!.map((servizio) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),

                            child: Row(
                              children: [
                                const Icon(Icons.check_circle, size: 20, color: Colors.teal),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Text(
                                      servizio,
                                      style: const TextStyle(fontSize: 16)
                                    )
                                ),
                              ],
                            ),
                          ))

                        else
                          const Text("Nessun servizio specificato."),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // bottone prenota
                    Align(
                      alignment: AlignmentGeometry.center,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Stanza prenotata (simulato)"),
                              backgroundColor: Colors.green
                            )
                          );
                        },
                        icon: const Icon(Icons.done),
                        label: const Text("Prenota"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  // costruisce la lista dei servizi offerti
  Widget _buildServizi({bool aperta = false, required List<Widget> children}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: ExpansionTile(
        initiallyExpanded: aperta,
        leading: Icon(
          Icons.room_service_outlined,
          color: Colors.teal
        ),

        title: Text(
          "Servizi Inclusi",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
        ),

        childrenPadding: const EdgeInsets.all(16),
        shape: const Border(),
        children: children,
      ),
    );
  }
}