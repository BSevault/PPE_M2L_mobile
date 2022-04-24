import 'package:flutter/material.dart';
import '../utils/requester.dart';

// void main(List<String> args) => runApp(ListeProduit());

class ListeProduit extends StatefulWidget {
  const ListeProduit({Key? key}) : super(key: key);

  @override
  State<ListeProduit> createState() => _ListeProduitState();
}

class _ListeProduitState extends State<ListeProduit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Liste des produits"),
        //   leading: const Icon(
        //     Icons.shopping_cart,
        //   ),
        // ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
              future: Requester.getRequest('/flutter/produits'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List produits = snapshot.data[0];
                  produits.removeRange(0, 3);
                  // print(produits);
                  return ListView.builder(
                    itemCount: produits.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text(
                          produits[index]['nom_produit'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(produits[index]['description']),
                        trailing: Text(
                          '${produits[index]['prix'].toStringAsFixed(2)} €',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        // contentPadding:
                        //     const EdgeInsets.fromLTRB(5, 0, 0, 20),
                        tileColor: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
