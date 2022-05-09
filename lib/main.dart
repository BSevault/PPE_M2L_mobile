import 'package:flutter/material.dart';
import 'package:mobile/page/covidTagParticipation.dart';
import 'package:mobile/page/reservations.dart';
import 'package:mobile/page/gestion_resa.dart';
import 'page/cart.dart';
import 'page/home.dart';

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
      routes: {
        '/': (context) => Home(title: 'M2L - Gestion des réunions'),
        '/gestion': (context) => GestionResa(),
        '/reservations': (context) => Reservations(title: 'Vos réservations'),
        '/cart': (context) => Cart(),
        '/covid': (context) => CovidTagParticipation(),
      },
    );
  }
}
