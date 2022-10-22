import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pictosonidos/pages/categorias/categorias.dart';
import 'package:pictosonidos/pages/inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      title: 'Pictosonidos',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es',''),
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => InicioPage(),
        '/categorias': (context) => CategoriasPage(),
      },
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff79bad0),
          background: Color(0xff1C1E25),
          secondary: Color(0xffeb7d86),
        ),
        scaffoldBackgroundColor: const Color(0xff79bad0),
        primaryColorDark: Colors.white,
        backgroundColor: const Color(0xff1C1E25),     //base #121212 10% de #7986cb
        primaryColor: Colors.indigo[500], //indigo[800]
        primaryColorLight: const Color(0xff7986cb),//indigo[300]
        brightness: Brightness.dark,
        cardColor: const Color(0xff34384f), //background + 0.16 from indigo[300]
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff2B2F40),
        ),
        dialogBackgroundColor: const Color(0xff1C1E25),
        // highlightColor: const Color(0xff121212),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffeb7d86),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5.0,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            side: const BorderSide(width: 1.5, color: Colors.white),
            elevation: 2.0,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme,
 ThemeMode.light for light theme,
 ThemeMode.dark for dark theme
*/
      debugShowCheckedModeBanner: false,
    );
  }
}