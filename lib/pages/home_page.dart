import "package:flutter/material.dart";

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  int currentIndex = 0;

  final List<Widget> screens = [
    // HomeScreen(),
    // BlogScreen(),
    // AboutUsScreen(),
    // MoreScreen()
  ];
}