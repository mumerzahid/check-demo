import 'ui/dark_light/dark_light_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'app/locator.dart';
import 'ui/multiple_themes/multiple_themes_view.dart';
import 'ui/theme_setup.dart';

Future main() async{
  await ThemeManager.initialise();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      // defaultThemeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        accentColor: Colors.white
      ),
      lightTheme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white70,
        accentColor: Colors.transparent
      ),
      statusBarColorBuilder: (theme) => theme.accentColor,
      // themes: getThemes(),
      builder:(context, regularTheme,darkTheme,themeMode)=> MaterialApp(
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        title: 'Flutter Demo',
        home:DarkLightView(),
      ),
    );
  }
}
