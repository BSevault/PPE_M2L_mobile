import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile/utils/requester.dart';

// ignore: must_be_immutable
class CheckParticipants extends StatefulWidget {
  CheckParticipants({Key? key, required this.idResa}) : super(key: key);
  int? idResa;

  @override
  State<CheckParticipants> createState() => _CheckParticipantsState();
}

class _CheckParticipantsState extends State<CheckParticipants> {
  @override
  Widget build(BuildContext context) {
    print(widget.idResa);

    return FutureBuilder(
      future: Requester.getRequest('/flutter/${widget.idResa}/participants'),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var allParticipants = snapshot.data as List;

          return Column(
            children: [
              ...(allParticipants[0] as List).map((oneParticipant) {
                // print(oneParticipant);
                bool test = false;

                return CheckboxListTile(
                  title: Text(
                      '${oneParticipant['prenom']} ${oneParticipant['nom']}'),
                  subtitle: Text(oneParticipant['email']),
                  value: timeDilation != 1.0,
                  onChanged: (bool? value) {
                    setState(() {
                      timeDilation = value! ? 1.2 : 1.0;
                    });
                  },
                  secondary: const Icon(Icons.person_pin),
                );
              })
            ],
          );
        } else {
          return Text("Ca marche pas");
        }
      }),
    );
  }
}
