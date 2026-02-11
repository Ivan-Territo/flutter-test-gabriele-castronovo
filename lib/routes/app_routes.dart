import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class AppRoutes {

  static const home = '/';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
  };
}




