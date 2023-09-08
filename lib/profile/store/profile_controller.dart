import 'package:mobx/mobx.dart';
import 'package:poker_manager_ui/profile/models/user_model.dart';
import 'package:poker_manager_ui/profile/services/profile_service.dart';

part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  _ProfileControllerBase(ProfileService profileService)
      : _profileService = profileService;

  late final ProfileService _profileService;

  @observable
  late UserModel user = UserModel(
      id: 0,
      nome: '',
      username: '',
      chavePix: '',
      endereco: '',
      role: '',
      isEnabled: true,
      partidas: []);

  @observable
  bool isLoading = false;

  @action
  Future getUser() async {
    isLoading = true;
    final userData = await _profileService.getPlayer();
    user = userData;
    isLoading = false;
  }
}
