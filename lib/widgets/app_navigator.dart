import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class AppNavigator extends StatelessWidget implements PreferredSizeWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {

    return AppBar(

      backgroundColor: Colors.grey[50],
      centerTitle: true,

      // icona a sinistra
      leading: Icon(
        Icons.waves,
        color: Colors.teal,
        size: 32,
      ),

      // navigazione centrale
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [

          // navigazione home
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.home);
            },
            child: const Text("Home"),
          ),

          // navigazione blog
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.blog);
            },
            child: const Text("Blog"),
          ),

          // navigazione about us
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.aboutus);
            },
            child: const Text("About us"),
          ),

          // more
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              iconAlignment: IconAlignment.end,
            ),
            onPressed: () { },
            icon: const Icon(Icons.keyboard_arrow_down, size: 20),
            label: const Text("More"),
          ),
        ],
      ),

      // bottone a destra
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              // si apre un menu penso?
            },
            label: const Text("Sing up"),
          ),
        )
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
