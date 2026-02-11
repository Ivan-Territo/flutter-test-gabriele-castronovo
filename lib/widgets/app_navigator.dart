import 'package:flutter/material.dart';

class AppNavigator extends StatelessWidget implements PreferredSizeWidget {

  const AppNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Sono la AppBar'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
