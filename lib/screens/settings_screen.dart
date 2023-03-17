import 'package:flutter/material.dart';
import 'package:flutter_estados/providers/theme_provider.dart';
import 'package:flutter_estados/share_preferences/preferences.dart';
import 'package:flutter_estados/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static String routerName = 'Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(SettingsScreen.routerName),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Ajustes',
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                const Divider(),
                SwitchListTile.adaptive(
                    inactiveTrackColor: Colors.yellow,
                    inactiveThumbColor: Colors.orange,
                    activeColor: Colors.blueGrey,
                    value: Preferences.isDarkMode,
                    title: const Text('DarkMode'),
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);

                      value
                          ? themeProvider.setDarkMode()
                          : themeProvider.setLightMode();
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: Preferences.gender,
                    title: const Text('Masculino'),
                    onChanged: (value) {
                      Preferences.gender = value ?? 1;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: Preferences.gender,
                    title: const Text('Femenino'),
                    onChanged: (value) {
                      Preferences.gender = value ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        labelText: 'Nombre', helperText: 'Nombre del usuario'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
