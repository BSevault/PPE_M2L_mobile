import 'package:flutter/material.dart';
import 'package:mobile/utils/requester.dart';

// ignore: must_be_immutable
class CheckParticipants extends StatelessWidget {
  CheckParticipants({Key? key, required this.idResa}) : super(key: key);
  int? idResa;

  @override
  Widget build(BuildContext context) {
    print(idResa);
    return FutureBuilder(
      future: Requester.getRequest('/flutter/$idResa/participants'),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.toString());
        } else {
          return Text("Ca marche pas");
        }
      }),
    );
  }
}
