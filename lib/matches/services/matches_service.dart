import 'dart:convert';

import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/http_interceptors.dart';
import '../models/matches_model.dart';

class MatchService {
  static const String baseUrl = "http://192.168.15.5:8080/match";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<List<MatchesModel>> getAllMatches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Bearer ");

    http.Response response = await client
        .get(Uri.parse('$baseUrl/find/matches'), headers: {
      'Authorization': 'Bearer ${token!}',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => MatchesModel.fromJson(e))
          .toList();
    } else {
      return Future.error("Erro ao carregar dados. Tente novamente.");
    }
  }

  //possível erro de CORS. Avaliar depois...
  Future<MatchesModel> creatingMatch(String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Bearer ");

    http.Response response = await client.post(Uri.parse('$baseUrl/cretion'),
        headers: {
          'Authorization': 'Bearer ${token!}',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(
          {
            'id': null,
            'jogadores': [],
            'usuarioAnfitriaoId': null,
            'quantidadeJogadores': null,
            'status': null,
            'data': date,
          },
        ));

    if (response.statusCode == 201) {
      return (jsonDecode(response.body));
    } else {
      return Future.error("Erro ao carregar dados. Tente novamente.");
    }
  }
}
