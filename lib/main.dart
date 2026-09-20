import 'package:flutter/material.dart';
import 'package:islamiapp/tabs/quran_tabs/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/screens/home_screen.dart';
import 'common/app_theme.dart';

void main() {
  SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISlamiApp',
      routes: {
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      theme: AppTheme.appTheme,
      home: HomeScreen(),
    );
  }
}
