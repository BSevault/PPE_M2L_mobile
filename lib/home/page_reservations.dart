import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mobile/utils/requester.dart';

import '../widget/bottom_nav.dart';

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
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...(resa[0] as List).map((oneResa) {
                    var dateResa = DateTime.parse(oneResa['date_resa']);
                    initializeDateFormatting('fr_FR', null);
                    return Card(
                      margin: const EdgeInsets.all(10),
                      shadowColor: Colors.black,
                      color: const Color.fromARGB(186, 254, 200, 22),
                      elevation: 8,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          maximumSize: const Size(double.infinity, 60),
                          backgroundColor:
                              const Color.fromARGB(186, 254, 200, 22),
                          primary: const Color(0xFF068D9D),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Salle ${oneResa['nom']} - ',
                            ),
                            Text(DateFormat.yMd('fr_FR').format(dateResa))
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavBar(),
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
