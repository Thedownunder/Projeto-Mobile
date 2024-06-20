import 'package:flutter/material.dart';
import 'home_page.dart';
import 'theme.dart';

class NewsPortalApp extends StatefulWidget {
  @override
  _NewsPortalAppState createState() => _NewsPortalAppState();
}

class _NewsPortalAppState extends State<NewsPortalApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal de Notícias',
      theme: lightGrayTheme,
      darkTheme: darkGrayTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        onToggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        isDarkMode: isDarkMode,
      ),
    );
  }
}
