// ignore_for_file: avoid_print, file_names

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import '../utils/requester.dart';
import '../widget/produit.dart';

// void main(List<String> args) => runApp(ListeProduit());

class ListeProduit extends StatefulWidget {
  const ListeProduit({Key? key}) : super(key: key);

  @override
  State<ListeProduit> createState() => _ListeProduitState();
}

class _ListeProduitState extends State<ListeProduit> {
  final ScrollController controller = ScrollController();
  List<Produit> listeProduits = [];
  List<Produit> cart = [];
  int cartTotalCount = 0;

  void addToCart(int index) {
    setState(() {
      listeProduits[index].count++;
      listeProduits[index].qte--;
      cartTotalCount++;
      if (!listeProduits[index].isInCart) {
        listeProduits[index].isInCart = true;
        cart.add(listeProduits[index]);
      }
    });
    print(
        '${listeProduits[index].nom} count: ${listeProduits[index].count} stock: ${listeProduits[index].qte} ');
    print('cartTotalCount: $cartTotalCount');
    for (var item in cart) {
      print('cart: ${item.nom}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args);

    void handleCart() async {
      args['cart'] = cart;
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
        var newCart =
            await Navigator.pushNamed(context, '/cart', arguments: args);
        setState(() {
          cart = newCart as List<Produit>;
          for (var produit in listeProduits) {
            produit.isInCart = false;
          }
          cartTotalCount = 0;
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: Requester.getRequest('/flutter/produits'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List produits = snapshot.data[0];
                produits.removeRange(0, 3);
                produits
                    .mapIndexed((index, produit) => {
                          listeProduits.add(
                            Produit(
                              id: produit['id'],
                              nom: produit['nom_produit'],
                              description: produit['description'],
                              qte: produit['qte_dispo'],
                              prix: produit['prix'],
                              isActive: produit['is_active'],
                              handleTap: () => addToCart(index),
                            ),
                          ),
                        })
                    .toList();
                return ListView(

                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: const Text(
                        'Voici la liste de nos produits disponibles',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        controller: controller,
                        itemCount: produits.length,
                        itemBuilder: (context, index) =>
                            listeProduits[index].isActive == 1
                                ? listeProduits[index]
                                : const SizedBox(height: 0)),
                    Container(
                      margin: const EdgeInsets.fromLTRB(100, 25, 100, 70),
                      child: ElevatedButton.icon(
                        onPressed: handleCart,
                        icon: Badge(
                          badgeColor: const Color(0xFF006875),
                          position: BadgePosition.topStart(top: -15),
                          borderSide:
                              const BorderSide(color: Color(0x7C000000)),
                          badgeContent: Text(
                            '$cartTotalCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Icon(Icons.shopping_cart),
                        ),
                        label: const Text("Valider votre panier"),
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
