import 'package:flutter/material.dart';
import 'package:flutter_preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:flutter_preferencias_usuario/src/widgets/widgets.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'settingsPage';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _colorSecundario;
  late int _genero;

  TextEditingController textEditingController = TextEditingController();
  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    textEditingController.text = prefs.nombreUsuario;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    prefs.ultimaPagina = SettingsPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajustes'),
          backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
        ),
        drawer: const MenuWidget(),
        body: ListView(children: [
          Container(
              alignment: Alignment.center,
              child: const Text(
                'settings page',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              )),
          const Divider(),
          SwitchListTile(
              title: const Text('Color secundario'),
              value: _colorSecundario,
              onChanged: (val) {
                setState(() {
                  _colorSecundario = val;
                  prefs.colorSecundario = val;
                });
              }),
          RadioListTile(
              title: const Text('Masculino'),
              value: 1,
              groupValue: _genero,
              onChanged: _selectedRadio),
          RadioListTile(
              title: const Text('Femenino'),
              value: 2,
              groupValue: _genero,
              onChanged: _selectedRadio),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre de la persona  '),
                onChanged: (val) => setState(() {
                      prefs.nombreUsuario = val;
                    })),
          )
        ]));
  }

  void _selectedRadio(int? value) {
    prefs.genero = value ?? 1;
    setState(() {
      _genero = value ?? 1;
    });
  }
}
