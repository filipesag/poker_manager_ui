import 'package:flutter/material.dart';
import 'package:poker_manager_ui/players/models/players_model.dart';
import 'package:poker_manager_ui/players/service/players_service.dart';

class PlayersRepository extends ChangeNotifier {
  late List<PlayersModel> _plyers = [];

  bool loading = false;
  PlayersService service = PlayersService();

  getAll(context) async {
    loading = true;
    _plyers = await service.getPlayers();
    loading = false;
    notifyListeners();
  }
}
