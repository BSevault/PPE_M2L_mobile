import 'package:flutter/material.dart';
import '../utils/class_participants.dart';

// ignore: must_be_immutable
class CheckParticipants extends StatefulWidget {
  CheckParticipants({Key? key, required this.idResa}) : super(key: key);
  int? idResa;

  @override
  State<CheckParticipants> createState() => _CheckParticipantsState();
}

class _CheckParticipantsState extends State<CheckParticipants> {
  var dataFetched;

  @override
  void initState() {
    super.initState();
    dataFetched = Participants.getParticipants(widget.idResa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataFetched,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var allParticipants = snapshot.data as List;

          void itemChange(bool? val, int index) {
            setState(() {
              allParticipants[index].isCheck = val;
              // print(allParticipants[index].isCheck);
            });
          }

          return ListView.builder(
            itemCount: allParticipants.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: Text(
                          '${allParticipants[index].prenom} ${allParticipants[index].nom}'),
                      subtitle: Text('${allParticipants[index].email}'),
                      value: allParticipants[index].isCheck,
                      onChanged: (bool? val) {
                        itemChange(val, index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Text("Ca marche pas");
        }
      }),
    );
  }
}
