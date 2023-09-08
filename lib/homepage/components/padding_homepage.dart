import 'package:flutter/material.dart';

class HomepagePadding extends StatelessWidget {
  void Function()? route;
  List<Widget> children;
  HomepagePadding({super.key, required this.route, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 80, right: 16.0, left: 16.0),
        child: GridView.count(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: route,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 124, 173, 126),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ]));
  }
}
