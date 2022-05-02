import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

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
  List<Produit> cart = args[];

    for (var item in args['cart']) {
      print(item.nom);
    }

    return DefaultTabController(
      length: 1,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // print(tabController.index);
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });

          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(widget.title),
              )
            ),
            body: ListView.builder(
              itemBuilder: itemBuilder
              ),
          );
        },
      ),
    );
  }
}