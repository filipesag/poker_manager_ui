import 'package:get_it/get_it.dart';
import 'package:poker_manager_ui/matches/services/matches_service.dart';
import 'package:poker_manager_ui/matches/store/match_controller.dart';
import 'package:poker_manager_ui/profile/services/profile_service.dart';
import 'package:poker_manager_ui/profile/store/profile_controller.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(MatchService());
  getIt.registerSingleton(MatchController(getIt.get<MatchService>()));
  getIt.registerSingleton(ProfileService());
  getIt.registerSingleton(ProfileController(getIt.get<ProfileService>()));
}
