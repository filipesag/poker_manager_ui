class PlayersModel {
  final String nome;
  final String username;
  final String chavePix;
  final String endereco;

  PlayersModel(
      {required this.nome,
      required this.username,
      required this.chavePix,
      required this.endereco});

  factory PlayersModel.fromMap(Map<String, dynamic> map) {
    return PlayersModel(
        nome: map['nome'],
        username: map['username'],
        chavePix: map['chavePix'],
        endereco: map['endereco']);
  }
}
