import 'package:flutter/material.dart';

class AppNavigator extends StatelessWidget implements PreferredSizeWidget {
  const AppNavigator({super.key});

  // L'altezza dell'AppBar. 80px dà un aspetto più arioso come nel design.
  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    // Colore verde preso dall'immagine (simile al Teal/Green)
    final Color brandColor = const Color(0xFF2D9C6C);

    return AppBar(
      backgroundColor:
          Colors.transparent, // Sfondo trasparente per fondersi con la pagina
      elevation: 0, // Rimuove l'ombra sotto l'appbar
      centerTitle: true, // Fondamentale per centrare il menu
      toolbarHeight: 80, // Altezza coerente con preferredSize
      // --- 1. LOGO (Sinistra) ---
      leadingWidth: 100, // Diamo spazio al logo
      leading: Container(
        padding: const EdgeInsets.only(
          left: 24,
        ), // Spaziatura dal bordo sinistro
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons
              .waves, // Placeholder per il logo (puoi cambiarlo con Image.asset)
          color: brandColor,
          size: 32,
        ),
      ),

      // --- 2. MENU CENTRALE (Centro) ---
      title: Row(
        mainAxisSize: MainAxisSize.min, // Occupa solo lo spazio necessario
        children: [
          _buildMenuItem("Home"),
          _buildMenuItem("Blog"),
          _buildMenuItem("About Us"),
          _buildMenuItem("More", showArrow: true), // "More" ha la freccina
        ],
      ),

      // --- 3. PULSANTE SIGN UP (Destra) ---
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 24,
          ), // Spaziatura dal bordo destro
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                // Azione sign up
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: brandColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ), // Bordo molto arrotondato (Pill shape)
                ),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget helper per creare i link del menu testuale per evitare ripetizioni
  Widget _buildMenuItem(String text, {bool showArrow = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () {},
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.grey[800], // Grigio scuro/nero soft
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (showArrow) ...[
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Colors.grey[800],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
