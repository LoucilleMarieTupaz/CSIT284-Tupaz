import 'package:flutter/material.dart';

//import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 104, 0, 148),
    surface: const Color.fromARGB(255, 230, 192, 247),
  ),
  cardTheme: const CardThemeData(
    elevation: 3,
    margin: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
  ),

  appBarTheme: const AppBarTheme(
    centerTitle: false,
    elevation: 0,
  ),

  scaffoldBackgroundColor: const Color(0xFFFFF8F2),

  //textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}