import 'package:flutter/material.dart';
import 'package:flutter_estados/providers/theme_provider.dart';
import 'package:flutter_estados/screens/screens.dart';
import 'package:flutter_estados/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: LoginScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => HomeScreen(),
        SettingsScreen.routerName: (_) => SettingsScreen(),
        LoginScreen.routerName: (_) => LoginScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
