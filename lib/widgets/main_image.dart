import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(

        // decorazione
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(4, 4),
            )
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child: Stack(
            fit: StackFit.expand,
            children: [

              Positioned.fill(
                child: Image.asset(
                  'assets/images/principal_image.jpg',
                  fit: BoxFit.cover,

                  // errore caricamento immagine
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.broken_image_outlined,
                      size: 120,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),

              // gradiente
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

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // testo in alto
                  Row(
                    children: [
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Secure Your Dream Vacation With a Reservation",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 39,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),

                  // ricerca room
                  Row(
                    children: [
                      const Spacer(flex: 1),
                      Container(

                        padding: const EdgeInsets.all(10),

                        // decorazione
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2,
                                spreadRadius: 1
                            ),
                          ],
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            // location
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey[600],
                                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.location_on, size: 20),
                                  SizedBox(width: 8),
                                  Text("Location"),
                                  SizedBox(width: 8),
                                  Icon(Icons.unfold_more, size: 20),
                                ],
                              ),
                            ),

                            // calendario
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey[600],
                                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () { },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.calendar_today, size: 18),
                                  SizedBox(width: 8),
                                  Text("Check-in - Check-out"),
                                  SizedBox(width: 8),
                                  Icon(Icons.unfold_more, size: 20),
                                ],
                              ),
                            ),

                            // person
                            TextButton.icon(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey[600],
                                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () { },
                              icon: const Icon(Icons.person_outline, size: 20),
                              label: const Text("Person"),
                            ),

                            // search
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () { },
                              icon: const Icon(Icons.search, size: 20),
                              label: const Text("Search"),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // testo in basso
                  Padding(

                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    child: Row(
                      children: [

                        // testo a sinistra
                        Expanded(
                          flex: 2,
                          child: Text(
                            "We believe in the power of the great outdoors. We think that everyone deserves the chance to explore the wild to find their very own adventure.",
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),

                        const Spacer(flex: 3),

                        // testo a destra
                        Expanded(
                          flex: 2,
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [

                              // numeri
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,

                                children: const [
                                  Text("121+", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                                  SizedBox(width: 50),
                                  Text("80+", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                                  SizedBox(width: 53),
                                  Text("1k", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                                  SizedBox(width: 25),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // testi sotto
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,

                                children: const [
                                  Text("Capital raised", style: TextStyle(color: Colors.white, fontSize: 8)),
                                  SizedBox(width: 15),
                                  Text("Happy customers", style: TextStyle(color: Colors.white, fontSize: 8)),
                                  SizedBox(width: 15),
                                  Text("Property options", style: TextStyle(color: Colors.white, fontSize: 8)),
                                ],
                              ),
                            ],
                          )
                        ),
                      ],
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

