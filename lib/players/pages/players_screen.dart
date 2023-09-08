import 'package:flutter/material.dart';
import 'package:poker_manager_ui/players/components/list_players.dart';
import 'package:poker_manager_ui/players/service/players_service.dart';
import 'package:provider/provider.dart';

import '../models/players_model.dart';
import '../repository/players_repository.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({super.key});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  Future<List<PlayersModel>>? futureListPlayers;
  final PlayersService _playerService = PlayersService();

  @override
  void initState() {
    super.initState();
    final postPLayers =
        Provider.of<PlayersRepository>(context, listen: false).getAll(context);
  }

  @override
  Widget build(BuildContext context) {
    final postPLayers = Provider.of<PlayersRepository>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 123, 194, 126),
        elevation: 0.3,
        title: const Text("Poker Manager"),
      ),
      backgroundColor: const Color.fromARGB(255, 174, 201, 175),
      body: SingleChildScrollView(
        child: postPLayers.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FutureBuilder(
                future: futureListPlayers,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final postPLayers = snapshot.data as List<PlayersModel>;
                    return ListPlayers(players: postPLayers);
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
      ),
    );
  }
}
