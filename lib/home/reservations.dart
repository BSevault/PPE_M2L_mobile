import 'package:flutter/material.dart';
import 'package:mobile/utils/requester.dart';
import 'package:mobile/widget/card_resa.dart';

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
                  ...(resa[0] as List).map(
                    (oneResa) {
                      return CardResa(oneResa: oneResa);
                    },
                  ),
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
