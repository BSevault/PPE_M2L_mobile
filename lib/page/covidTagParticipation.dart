import 'package:flutter/material.dart';
import 'package:mobile/utils/requester.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CovidTagParticipation extends StatefulWidget {
  const CovidTagParticipation({Key? key}) : super(key: key);

  @override
  State<CovidTagParticipation> createState() => _CovidTagParticipationState();
}

class _CovidTagParticipationState extends State<CovidTagParticipation> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Nom: ${user['nom']}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 21, 121, 133),
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Prenom: ${user['prenom']}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 21, 121, 133),
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Date: ${resa['date_formated']}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 21, 121, 133),
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Salle: ${resa['nom_salle']}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 21, 121, 133),
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Vous certifiez sur l\'honneur de votre vache avoir été dépisté COVID19.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 204, 72, 32),
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(12),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Requester.postRequest(
                        '/flutter/${user['id']}/participations/history',
                        {'date_resa': dateResa});
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Merci, nous envoyons le CDC à votre adresse.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                        duration: Duration(milliseconds: 2500),
                      ),
                    );
                  },
                  icon: const Icon(Icons.send_sharp),
                  label: Padding(
                    padding: EdgeInsets.all(12),
                    child: const Text(
                      "Valider le signalement",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
