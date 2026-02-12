import 'package:flutter/material.dart';
import '../widgets/app_navigator.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[50],

      appBar: AppNavigator(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Giorgio Venturella"),
            const SizedBox(height: 20),
            Text("Gabriele Castronovo"),
            const SizedBox(height: 20),
            Text("Marco Filizzola")
          ],
        ),
      ),
    );
  }
}
