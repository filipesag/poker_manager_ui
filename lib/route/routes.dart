import 'package:go_router/go_router.dart';
import 'package:poker_manager_ui/homepage/pages/homepage_screen.dart';
import 'package:poker_manager_ui/auth/pages/login_screen.dart';
import 'package:poker_manager_ui/matches/pages/matches_screen.dart';
import 'package:poker_manager_ui/perfomance/pages/perfomance_screen.dart';
import 'package:poker_manager_ui/players/pages/players_screen.dart';
import 'package:poker_manager_ui/profile/pages/profile_screen.dart';
import 'package:poker_manager_ui/ranking/pages/ranking_screen.dart';

final routes = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
  GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  GoRoute(path: '/perfil', builder: (context, state) => const ProfileScreen()),
  GoRoute(
      path: '/perfomance',
      builder: (context, state) => const PerfomanceScreen()),
  GoRoute(
      path: '/partidas', builder: (context, state) => const MatchesScreen()),
  GoRoute(
      path: '/jogadores', builder: (context, state) => const PlayersScreen()),
  GoRoute(path: '/ranking', builder: (context, state) => const RankingScreen()),
  GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
]);
