import 'package:flutter/material.dart';
import 'package:poker_manager_ui/matches/services/matches_service.dart';
import 'package:poker_manager_ui/players/repository/players_repository.dart';
import 'package:poker_manager_ui/services/locator.dart';
import 'route/routes.dart';
import 'package:provider/provider.dart';

void main() {
  setup();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PlayersRepository>(
          create: (context) => PlayersRepository()),
    ],
    child: const MyApp(),
  ));
  final service = getIt.get<MatchService>();
  service.creatingMatch('02/09/2024');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
