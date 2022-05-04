import 'package:flutter/material.dart';
import 'package:mobile/utils/requester.dart';
import 'package:mobile/widget/card_resa.dart';
import 'package:mobile/widget/card_parti_covid.dart';
// import 'package:mobile/widget/check_parti_covid.dart';

// ignore: must_be_immutable
class PartiHistory extends StatefulWidget {
  PartiHistory({Key? key, this.user}) : super(key: key);
  Map? user;

  @override
  State<PartiHistory> createState() => _PartiHistoryState();
}

class _PartiHistoryState extends State<PartiHistory> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return FutureBuilder(
      future: Requester.getRequest(
          '/flutter/${args['userId']}/participations/history'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var resa = snapshot.data as List;

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...(resa[0] as List).map(
                    (oneResa) {
                      return CardPartiCovid(
                          oneResa: oneResa, user: widget.user);
                    },
                  ),
                ],
              ),
              // child: CheckPartiCovid(userId: args['userId']),
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
