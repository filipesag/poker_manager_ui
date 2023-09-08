import 'package:flutter/material.dart';

class ProfileNameListTile extends StatelessWidget {
  ProfileNameListTile(
      {super.key,
      required this.name,
      required this.username,
      required this.icon});
  Text name;
  Text username;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: name,
          subtitle: username,
        ),
      ],
    );
  }
}
