import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../auth/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 123, 194, 126),
          elevation: 0.3,
          title: const Text("Poker Manager"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ]),
      backgroundColor: const Color.fromARGB(255, 164, 194, 165),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 16.0, left: 16.0),
        child: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                GoRouter.of(context).push('/perfil');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 124, 173, 126),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Perfil',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage("lib/assets/images/user.png"),
                          width: 30,
                        ),
                      ]),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                GoRouter.of(context).push('/perfomance');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 124, 173, 126),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Perfomance',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage("lib/assets/images/analytics.png"),
                          width: 30,
                        ),
                      ]),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                GoRouter.of(context).push('/partidas');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 124, 173, 126),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Partidas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage("lib/assets/images/cards.png"),
                          width: 30,
                        ),
                      ]),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                GoRouter.of(context).push('/jogadores');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 124, 173, 126),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Jogadores',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage("lib/assets/images/people.png"),
                          width: 30,
                        ),
                      ]),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                GoRouter.of(context).push('/ranking');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 124, 173, 126),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Ranking',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage("lib/assets/images/podium.png"),
                          width: 30,
                        ),
                      ]),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                _authService.logout().then(
                    (value) => GoRouter.of(context).pushReplacement('/login'));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 124, 173, 126),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image(
                          image: AssetImage("lib/assets/images/logout.png"),
                          width: 30,
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
