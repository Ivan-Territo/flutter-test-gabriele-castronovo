import 'package:flutter/material.dart';
import './routes/app_routes.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exam',

      // tema
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // routes
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
