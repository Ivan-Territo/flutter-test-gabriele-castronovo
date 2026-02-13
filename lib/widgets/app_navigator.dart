import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class AppNavigator extends StatelessWidget implements PreferredSizeWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.sizeOf(context).width;
    double padding = screenWidth * 0.018;

    return AppBar(
      backgroundColor: Colors.grey[50],
      centerTitle: true,
      titleSpacing: 0,

      // icona a sinistra
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Icon(Icons.waves, color: Colors.teal, size: 28),
      ),

      // title
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMenuItem(context, "Home", AppRoutes.home),
            _buildMenuItem(context, "Blog", AppRoutes.blog),
            _buildMenuItem(context, "About us", AppRoutes.aboutus),

            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                minimumSize: Size.zero,
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("More", style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.keyboard_arrow_down, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),

      // bottone a destra
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            onPressed: () { },
            label: const Text("Sign up"),
          ),
        )
      ],
    );
  }

// costruisce l'item del menu
  Widget _buildMenuItem(BuildContext context, String text, String route) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        minimumSize: Size.zero,
      ),
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
