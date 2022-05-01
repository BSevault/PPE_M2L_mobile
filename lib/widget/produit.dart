// import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Produit extends StatelessWidget {
  Produit({
    Key? key,
    required this.id,
    required this.nom,
    required this.description,
    required this.qte,
    required this.prix,
    required this.isActive,
    required this.handleTap
  })
  : super(key: key);

  final int id;
  final String nom;
  final String description;
  final int qte;
  final double prix;
  final int isActive;
  int count = 0;
  bool isInCart = false;
  final VoidCallback handleTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          nom,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Text(
          '${prix.toStringAsFixed(2)} €',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        tileColor: Theme.of(context).primaryColorLight,
        onTap: handleTap,
      ),
    );
  }
}
