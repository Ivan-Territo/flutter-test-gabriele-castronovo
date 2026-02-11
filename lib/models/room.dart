class Room {

  final int id;
  final String? nomeStanza;
  final String? tipologia;
  final int? prezzoNotte;
  final int? postiLetto;
  final List<String>? servizi;
  final bool? disponibile;
  final String? urlImmagine;

  Room({
    required this.id,
    this.nomeStanza,
    this.tipologia,
    this.prezzoNotte,
    this.postiLetto,
    this.servizi,
    this.disponibile,
    this.urlImmagine
  });

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
