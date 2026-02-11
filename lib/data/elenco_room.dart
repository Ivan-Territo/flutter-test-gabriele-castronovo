import 'package:flutter/foundation.dart';
import 'package:flutter_login_profile_lesson/services/api_service.dart';
import '../models/room.dart';

class ElencoRooms {

  // singleton
  static final ElencoRooms _instance = ElencoRooms._internal();
  factory ElencoRooms() => _instance;
  ElencoRooms._internal();

  List<Room> listaRooms = [];

  // cerca una room
  Room? cercaRoom(String nome) {
    try {
      return listaRooms.firstWhere((room) => room.nomeStanza == nome);
    }
    catch (e) {
      return null;
    }
  }

  // carica lista
  Future<void> caricaLista() async {
    final rawList = await ApiService().getRooms();
    listaRooms = rawList.map((x) => Room.fromJson(x)).toList();
    if (kDebugMode) { print('✅ Caricati: ${listaRooms.length}'); }
  }
}

final ElencoRooms gestoreRooms = ElencoRooms();