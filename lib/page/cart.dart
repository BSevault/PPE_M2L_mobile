import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mobile/page/gestion_resa.dart';

import '../utils/requester.dart';
import '../widget/produit.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  final String title = 'Votre panier';

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    List<Produit> cart = args['cart'];

    handleCart() async {
      int userId = args['userIdResa'];
      int resaId = args['idResa'];
      if (!cart.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Votre panier est vide',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            duration: Duration(milliseconds: 2500),
          ),
        );
      } else {
        for (var produit in cart) {
          await Requester.postRequest('/flutter/produits/$userId/$resaId',
              {'qte': produit.count, 'produit_id': produit.id});
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Votre commande est confirmée',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            duration: Duration(milliseconds: 2500),
          ),
        );

        Future.delayed(const Duration(milliseconds: 2500),
            () => {
              Navigator.pushNamedAndRemoveUntil(context, '/gestion', (Route<dynamic> route) => false,arguments: args),
            });
      }
    }

    String cartTotal(List<Produit> cart) {
      double total = 0;
      for (var produit in cart) {
        total += produit.count * produit.prix;
      }
      return total.toStringAsFixed(2);
    }

    for (var item in cart) {
      print(item.nom);
    }

    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(widget.title),
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                          title:
                              Text('${cart[index].nom} x${cart[index].count}'),
                          trailing: Text(
                              ' ${(cart[index].count * cart[index].prix).toStringAsFixed(2)} €')),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Text(
                  'Total: ${cartTotal(cart)} €',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(100, 25, 100, 25),
                child: ElevatedButton.icon(
                  onPressed: handleCart,
                  icon: const Icon(Icons.euro),
                  label: const Text("Confirmer la commande"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
