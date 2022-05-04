import 'package:flutter/material.dart';
import 'package:mobile/utils/requester.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CovidTest extends StatefulWidget {
  const CovidTest({Key? key}) : super(key: key);

  @override
  State<CovidTest> createState() => _CovidTestState();
}

class _CovidTestState extends State<CovidTest> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    var resa = args['oneResa'];
    var user = args['user'];
    // dateformating de mes klawi
    var dateResa = resa['date_formated'].split('/').reversed.join('-');

    return Scaffold(
      appBar: AppBar(
        title: Text("Despitage COVID Positif"),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Nom: ${user['nom']}'),
            Text('Prenom: ${user['prenom']}'),
            Text('Date: ${resa['date_formated']}'),
            Text('Salle: ${resa['nom_salle']}'),
            Text(
                'Vous certifiez sur l\'honneur de votre vache avoir été dépisté COVID19.'),
            ElevatedButton.icon(
              onPressed: () {
                Requester.postRequest(
                    '/flutter/${user['id']}/participations/history',
                    {'date_resa': dateResa});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Merci, nous envoyons le CDC à votre adresse.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    duration: Duration(milliseconds: 2500),
                  ),
                );
              },
              icon: const Icon(Icons.send_sharp),
              label: const Text("Valider le signalement"),
            )
          ],
        ),
      ),
    );
  }
}
