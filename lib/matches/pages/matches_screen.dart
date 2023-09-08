import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poker_manager_ui/matches/components/creating_matches_button.dart';
import '../../services/locator.dart';
import '../store/match_controller.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  final _match = getIt.get<MatchController>();

  @override
  void initState() {
    getMatches();
    super.initState();
  }

  Future<void> getMatches() async {
    await _match.getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 123, 194, 126),
        elevation: 0.3,
        title: const Text("Poker Manager"),
      ),
      backgroundColor: const Color.fromARGB(255, 174, 201, 175),
      body: Observer(
        builder: (context) {
          if (_match.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(left: 80, right: 80, top: 30),
                child: CreateMatchButton(onTap: () {}),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "HISTÓRICO DE PARTIDAS: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _match.listMatches.length,
                itemBuilder: (context, index) {
                  final match = _match.listMatches[index];
                  return ListTile(
                    title: Text(match.status ?? ''),
                  );
                },
              )
            ]),
          );
        },
      ),
    );
  }
}
