import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:poker_manager_ui/auth/models/token_model.dart';
import 'package:poker_manager_ui/services/http_interceptors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String basuUrl = "http://192.168.15.5:8080/auth/authenticate";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<bool> login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await client.post(Uri.parse(basuUrl),
        body: {'username': username, 'password': password});
    TokenModel bodyToken = TokenModel.fromJson(jsonDecode(response.body));
    String token = bodyToken.token;
    if (response.statusCode == 200) {
      prefs.setString("username", username);
      prefs.setString("Bearer ", token);
      return true;
    } else {
      throw HttpException(response.body);
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
