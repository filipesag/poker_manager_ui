class UserModel {
  int id;
  String nome;
  String username;
  String chavePix;
  String endereco;
  String role;
  bool isEnabled;
  List<Map<String, dynamic>> partidas;

  UserModel({
    required this.id,
    required this.nome,
    required this.username,
    required this.chavePix,
    required this.endereco,
    required this.role,
    required this.isEnabled,
    required this.partidas,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        nome: json["nome"],
        username: json["username"],
        chavePix: json["chavePix"],
        endereco: json["endereco"],
        role: json["role"],
        isEnabled: json["isEnabled"],
        partidas: List<Map<String, dynamic>>.from(json["partidas"] as List),
      );
}
