import 'package:flutter/material.dart';
import 'package:flutter_login_profile_lesson/pages/aboutus_page.dart';
import 'package:flutter_login_profile_lesson/pages/blog_page.dart';
import '../pages/home_page.dart';

class AppRoutes {

  static const home = '/home';
  static const blog = '/blog';
  static const aboutus = '/aboutus';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    blog: (context) => BlogPage(),
    aboutus: (context) => AboutusPage(),
  };
}




