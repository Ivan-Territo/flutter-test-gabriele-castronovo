class Room {

  Room() {
  }

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      nomeStanza: json['nome_stanza'],
      tipologia: json['tipologia'],
      prezzoNotte: json['prezzo_notte'],
      postiLetto: json['posti_letto'],
      servizi: List<String>.from(json['servizi']),
      disponibile: json['disponibile'],
      urlImmagine: json['url_immagine'],
    );
  }
}
