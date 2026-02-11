import 'package:flutter/material.dart';
import '../widgets/app_navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavigator(),
      body: const Center(
          child: Text('Siamo nella homepage')
      ),
    );
  }
}
