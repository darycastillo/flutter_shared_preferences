import 'package:flutter/material.dart';

import 'package:flutter_preferencias_usuario/src/pages/pages.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Container(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/menu-img.jpeg'))),
        ),
        ListTile(
          title: const Text('Home'),
          leading: const Icon(Icons.pages, color: Colors.blue),
          onTap: () =>
              Navigator.pushReplacementNamed(context, HomePage.routeName),
        ),
        ListTile(
          title: const Text('Party mode'),
          leading: const Icon(Icons.party_mode, color: Colors.blue),
          onTap: () {},
        ),
        ListTile(
          title: const Text('People'),
          leading: const Icon(Icons.people, color: Colors.blue),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Setting'),
          leading: const Icon(Icons.settings, color: Colors.blue),
          onTap: () =>
              Navigator.pushReplacementNamed(context, SettingsPage.routeName),
        )
      ],
    ));
  }
}
