import 'package:flutter/material.dart';
import '../widgets/app_navigator.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.grey[50],

        appBar: AppNavigator(),
        body: SafeArea(
            child: Center(
              child: Text("Blog page"),
            )
        )
    );
  }
}
