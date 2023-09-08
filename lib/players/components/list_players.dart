import 'package:flutter/material.dart';

import '../models/players_model.dart';

class ListPlayers extends StatelessWidget {
  final List<PlayersModel> players;
  const ListPlayers({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int player) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(players[player].nome),
            subtitle: Text(players[player].username),
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: players.length);
  }
}
