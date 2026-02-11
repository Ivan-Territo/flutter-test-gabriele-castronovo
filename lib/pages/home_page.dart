import 'package:flutter/material.dart';
import '../widgets/app_navigator.dart';
import '../widgets/carosello.dart';
import '../widgets/main_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[50],

      appBar: AppNavigator(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainImage(),
              Carosello(),
            ],
          )
        )
      )
    );
  }
}
