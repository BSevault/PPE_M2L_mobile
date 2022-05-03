import 'package:flutter/material.dart';

class CovidTest extends StatefulWidget {
  const CovidTest({Key? key}) : super(key: key);

  @override
  State<CovidTest> createState() => _CovidTestState();
}

class _CovidTestState extends State<CovidTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coucou"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("data"),
            ElevatedButton.icon(
              onPressed: () {
                // request HERE !!!!!!
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Liste d\'appel mis à jour !',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    duration: Duration(milliseconds: 2500),
                  ),
                );
              },
              icon: const Icon(Icons.send_sharp),
              label: const Text("Enregistrer"),
            )
          ],
        ),
      ),
    );
  }
}
