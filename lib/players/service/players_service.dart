import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/http_interceptors.dart';
import '../models/players_model.dart';

class PlayersService {
  String basuUrl = "http://192.168.15.5:8080/users/find/all";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<List<PlayersModel>> getPlayers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Bearer ");
    late List<PlayersModel> players = [];

    http.Response response = await client.get(Uri.parse(basuUrl), headers: {
      'Authorization': 'Bearer ${token!}',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      body['content'].map((x) {
        final PlayersModel player = PlayersModel.fromMap(x);
        players.add(player);
      }).toList();
      return players;
    } else {
      return Future.error("Erro ao carregar dados. Tente novamente.");
    }
  }
}
