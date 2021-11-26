import 'package:flutter/material.dart';
import 'package:flutter_preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:flutter_preferencias_usuario/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'homePage';
  final prefs = PreferenciasUsuario();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias de usuario'),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario ${prefs.colorSecundario}'),
          const Divider(),
          Text('Genero: ${prefs.genero}'),
          const Divider(),
          Text('Nombre usuario: ${prefs.nombreUsuario}')
        ],
      ),
    );
  }
}
