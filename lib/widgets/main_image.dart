import 'package:flutter/material.dart';

class MainImage extends StatelessWidget implements PreferredSizeWidget {
  const MainImage({super.key});

  @override
  Widget build(BuildContext context) {

    // impostazioni schermo
    double screenWidth = MediaQuery.sizeOf(context).width;
    double fontTitolo = (screenWidth * 0.033).clamp(16, 50);
    int ricercaSize = (3000 / screenWidth).round().clamp(1, 8);
    double fontTestoSinistra = (screenWidth * 0.014).clamp(6, 16);
    int spacerBasso = (screenWidth / 200).round().clamp(1, 20);


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
                        Colors.black38,
                      ],
                      stops: const [0.6, 1.0],
                    ),
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const Spacer(flex: 3),

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
                                  fontSize: fontTitolo,
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

                  const Spacer(flex: 1),

                  // ricerca room
                  Row(
                    children: [
                      Spacer(flex: 1),

                      Expanded(
                        flex: ricercaSize,
                        child: Container(
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

                          child: FittedBox(
                            fit: BoxFit.scaleDown,
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
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.location_on, size: 18),
                                      Text("Location"),
                                      Icon(Icons.unfold_more, size: 18),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.calendar_today, size: 18),
                                      Text("Check-in - Check-out"),
                                      Icon(Icons.unfold_more, size: 18),
                                    ],
                                  ),
                                ),

                                // person
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.grey[600],
                                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () { },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.person_outline, size: 18),
                                      Text("Person"),
                                      Icon(Icons.unfold_more, size: 18),
                                    ],
                                  ),
                                ),

                                // search
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () { },
                                  icon: const Icon(Icons.search, size: 18),
                                  label: const Text("Search"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),

                  const Spacer(flex: 4),

                  // testo in basso
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    child: Row(
                      children: [

                        // testo a sinistra
                        Expanded(
                          flex: 8,
                          child: Text(
                            "We believe in the power of the great outdoors. We think that everyone deserves the chance to explore the wild to find their very own adventure.",
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: fontTestoSinistra,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),

                        Spacer(flex: spacerBasso),

                        // testo a destra
                        Expanded(
                          flex: 8,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [
                                // numeri
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text("121+", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 105),
                                    Text("80+", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 160),
                                    Text("1k", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 90),
                                  ],
                                ),
                                const SizedBox(height: 4),

                                // testi sotto
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text("Capital raised", style: TextStyle(color: Colors.white, fontSize: 28)),
                                    const SizedBox(width: 15),
                                    Text("Happy customers", style: TextStyle(color: Colors.white, fontSize: 28)),
                                    const SizedBox(width: 15),
                                    Text("Property options", style: TextStyle(color: Colors.white, fontSize: 28)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}