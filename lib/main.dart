import 'package:flutter/material.dart';
import 'package:flutter_preferencias_usuario/src/share_prefs/preferencias_usuario.dart';

import 'src/pages/pages.dart';

void main() async {
  //cuano necesitamos inicizilar metodos asincronos que afecten los widgets
  WidgetsFlutterBinding.ensureInitialized();
  //inicializar las prefrencias de usuario
  await PreferenciasUsuario().initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Preferencias',
        initialRoute: prefs.ultimaPagina,
        routes: {
          HomePage.routeName: (_) => HomePage(),
          SettingsPage.routeName: (_) => const SettingsPage()
        });
  }
}
