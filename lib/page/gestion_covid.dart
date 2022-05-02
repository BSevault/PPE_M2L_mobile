import 'package:flutter/material.dart';
import 'package:mobile/page/listeProduit.dart';
import 'package:mobile/tests/check_parti_covid_test.dart';
import 'package:mobile/widget/check_participants.dart';

class GestionCovid extends StatefulWidget {
  const GestionCovid({Key? key}) : super(key: key);

  @override
  State<GestionCovid> createState() => _GestionCovidState();
}

class _GestionCovidState extends State<GestionCovid> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    // print(args);

    return Scaffold(
      appBar: AppBar(
        title: Text('${args['titre']}'),
        bottom: const TabBar(
          tabs: [
            Tab(
              icon: Icon(
                Icons.check,
                color: Color.fromARGB(255, 254, 200, 22),
              ),
              text: "Participants",
            ),
            Tab(
              icon: Icon(Icons.food_bank_outlined,
                  color: Color.fromARGB(255, 254, 200, 22)),
              text: "Services",
            ),
            // Tab(
            //   icon: Icon(Icons.medical_services_outlined),
            //   text: "Covid",
            // )
          ],
        ),
      ),
      body: Center(
        child: CheckPartiCovid(
          userId: args['userId'],
        ),
      ),
    );
  }
}
