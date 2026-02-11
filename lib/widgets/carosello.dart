import 'package:flutter/material.dart';

class Carosello extends StatelessWidget {
  const Carosello({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

        // decorazione
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),

        // contenuto
        child: Stack(
          children: [
            Center(child: Text("Carosello")),
          ],
        ),
      ),
    );
  }
}
