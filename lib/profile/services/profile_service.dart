import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/http_interceptors.dart';
import '../models/user_model.dart';

class ProfileService {
  static const String baseUrl = "http://192.168.15.5:8080/users/find/all/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<UserModel> getPlayer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Bearer ");
    String? username = prefs.getString("username");

    http.Response response = await client.get(Uri.parse('$baseUrl$username'),
        headers: {
          'Authorization': 'Bearer ${token!}',
          'Content-Type': 'application/json'
        });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      UserModel player = UserModel.fromJson(body);
      return player;
    } else {
      return Future.error("Erro ao carregar dados. Tente novamente.");
    }
  }
}
