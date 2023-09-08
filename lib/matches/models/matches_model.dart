class MatchesModel {
  dynamic id;
  Set<dynamic> jogadores;
  dynamic usuarioAnfitriaoId;
  dynamic quantidadeJogadores;
  dynamic status;
  dynamic data;

  MatchesModel({
    required this.id,
    required this.jogadores,
    required this.usuarioAnfitriaoId,
    required this.quantidadeJogadores,
    required this.status,
    required this.data,
  });

  factory MatchesModel.fromJson(Map<String, dynamic> json) => MatchesModel(
        id: json["id"],
        jogadores: Set<dynamic>.from(json["jogadores"].map((x) => x)),
        usuarioAnfitriaoId: json["usuarioAnfitriaoId"],
        quantidadeJogadores: json["quantidadeJogadores"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jogadores": Set<dynamic>.from(jogadores.map((x) => x)),
        "usuarioAnfitriaoId": usuarioAnfitriaoId,
        "quantidadeJogadores": quantidadeJogadores,
        "status": status,
        "data": data,
      };
}
