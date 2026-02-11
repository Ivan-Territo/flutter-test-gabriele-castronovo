import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_profile_lesson/data/elenco_room.dart';
import 'app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Future.wait([
      gestoreRooms.caricaLista(),
      // altre robe da caricaree
    ]);
  } catch (e) {
    if (kDebugMode) print("❌ Errore durante l'estrazione dei dati: $e");
  }

  runApp(const MyApp());
}
