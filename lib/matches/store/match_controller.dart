import 'package:mobx/mobx.dart';
import 'package:poker_manager_ui/matches/models/matches_model.dart';
import 'package:poker_manager_ui/matches/services/matches_service.dart';

part 'match_controller.g.dart';

class MatchController = _MatchControllerBase with _$MatchController;

abstract class _MatchControllerBase with Store {
  _MatchControllerBase(MatchService matchService)
      : _matchService = matchService;

  late final MatchService _matchService;

  @observable
  List<MatchesModel> listMatches = [];

  @observable
  bool isLoading = false;

  @action
  Future getMatches() async {
    isLoading = true;
    final matches = await _matchService.getAllMatches();
    listMatches = matches;
    isLoading = false;
  }
}
