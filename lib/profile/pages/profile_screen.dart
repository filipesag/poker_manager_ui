import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poker_manager_ui/profile/components/attributes_list_tile_components.dart';
import 'package:poker_manager_ui/profile/store/profile_controller.dart';
import 'package:poker_manager_ui/services/locator.dart';
import '../components/profile_name_list_tile_compoent.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profile = getIt.get<ProfileController>();

  Future<void> getUser() async {
    await _profile.getUser();
  }

  @override
  void initState() {
    getUser();
    super.initState();
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
      body: Observer(builder: (context) {
        if (_profile.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image:
                              AssetImage("lib/assets/images/profile_pic.jpg")),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(_profile.user.nome, style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 45),
                const Divider(
                  thickness: 1,
                  indent: 3,
                  endIndent: 3,
                ),
                const SizedBox(height: 15),
                ProfileNameListTile(
                  icon: const Icon(Icons.person),
                  name: Text(_profile.user.nome),
                  username: Text(_profile.user.username),
                ),
                const SizedBox(height: 5),
                ProfileListTile(
                  icon: const Icon(Icons.attach_money),
                  text: Text(_profile.user.chavePix),
                ),
                const SizedBox(height: 5),
                ProfileListTile(
                  icon: const Icon(Icons.house),
                  text: Text(_profile.user.endereco),
                ),
                const SizedBox(height: 5),
                ProfileListTile(
                  icon: const Icon(Icons.table_bar_sharp),
                  text: Text(
                      '${_profile.user.partidas.where((e) => e['cancelado'] == false).length} Partidas'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 44, 112, 46),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {},
                        child: const Text("Editar Perfil"))),
              ],
            ),
          ),
        );
      }),
    );
  }
}
