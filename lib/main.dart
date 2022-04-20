import 'package:flutter/material.dart';
import 'package:mobile/page/reservations.dart';
import 'package:mobile/page/gestion_resa.dart';
import 'page/my_home_page.dart';

void main() => runApp(const MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF068D9D),
      ),
      home: const MyHomePage(title: 'M2L - Gestion des réunions'),
      routes: <String, WidgetBuilder>{
        '/gestion': (BuildContext context) => const GestionResa(
              title: 'Gestion de réservations',
            ),
        '/reservations': ((BuildContext context) => const Reservations(
              title: 'Vos réservations',
            )),
      },
    );
  }
}
