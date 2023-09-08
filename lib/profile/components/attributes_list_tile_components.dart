import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  ProfileListTile({super.key, required this.icon, required this.text});
  Icon icon;
  Text text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: text,
    );
  }
}
