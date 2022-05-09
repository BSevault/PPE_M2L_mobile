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
  int qte;
  final double prix;
  final int isActive;
  int count = 0;
  bool isInCart = false;
  final VoidCallback? handleTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // enabled: ,
        title: Text(
          nom,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: qte > 0 ? Text(description) : const Text('Plus de stock disponible'),
        trailing: Text(
          '${prix.toStringAsFixed(2)} €',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        tileColor: qte > 0 ? Theme.of(context).primaryColorLight : Colors.grey,
        onTap: qte > 0 ? handleTap : null,
        
      ),
    );
  }
}
