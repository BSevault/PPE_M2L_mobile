import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mobile/utils/requester.dart';

// ignore: must_be_immutable
class Reservations extends StatefulWidget {
  const Reservations({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return FutureBuilder(
      future: Requester.getRequest('/flutter/${args['userId']}/reservations'),
      builder: (context, snapshot) {
        // print(args['userId']);
        // print(snapshot.data);
        if (snapshot.hasData) {
          var resa = snapshot.data as List;

          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...(resa[0] as List).map((oneResa) {
                    initializeDateFormatting('fr_FR', null);
                    // print(DateFormat.yMd('fr_FR').format(DateTime.now()));
                    var dateResa = DateTime.parse(oneResa['date_resa'])
                        .add(const Duration(days: 1));
                    var dateSec = DateTime.now().add(const Duration(days: 2));

                    ButtonStyle styleBtn;
                    var onPressFct;
                    Color colorCard;
                    String textCard =
                        'Salle ${oneResa['nom']} - ${DateFormat.yMd('fr_FR').format(dateResa)}';

                    if (DateFormat.yMd('fr_FR').format(dateResa) ==
                        (DateFormat.yMd('fr_FR').format(dateSec))) {
                      styleBtn = TextButton.styleFrom(
                          maximumSize: const Size(double.infinity, 60),
                          backgroundColor:
                              const Color.fromARGB(186, 254, 200, 22),
                          primary: const Color(0xFF068D9D),
                          textStyle: const TextStyle(fontSize: 20));

                      onPressFct = () {
                        Navigator.pushNamed(context, '/participant',
                            arguments: {
                              "idResa": oneResa['id'],
                              "titre": textCard,
                            });
                      };
                      colorCard = const Color.fromARGB(186, 254, 200, 22);
                    } else {
                      styleBtn = TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20));
                      onPressFct = null;
                      colorCard = const Color.fromARGB(185, 150, 141, 111);
                    }

                    return Card(
                      margin: const EdgeInsets.all(10),
                      shadowColor: Colors.black,
                      color: colorCard,
                      elevation: 8,
                      child: TextButton(
                        onPressed: onPressFct,
                        style: styleBtn,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(textCard),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
