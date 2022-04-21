import 'package:flutter/material.dart';
import '../utils/class_participants.dart';

// ignore: must_be_immutable
class CheckParticipants extends StatefulWidget {
  CheckParticipants({Key? key, required this.idResa}) : super(key: key);
  int? idResa;

  @override
  State<CheckParticipants> createState() => _CheckParticipantsState();
}

class _CheckParticipantsState extends State<CheckParticipants>
    with AutomaticKeepAliveClientMixin {
  var dataFetched;

  @override
  void initState() {
    super.initState();
    dataFetched = Participants.getParticipants(widget.idResa);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataFetched,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var allParticipants = snapshot.data as List;
          var colorCard = const Color.fromARGB(255, 241, 237, 187);

          void itemChange(bool? val, int index) {
            setState(() {
              allParticipants[index].isCheck = val;
              // // print(allParticipants[index].isCheck);
            });
          }

          return Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                itemCount: allParticipants.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: colorCard,
                    child: CheckboxListTile(
                      title: Text(
                        '${allParticipants[index].prenom} ${allParticipants[index].nom}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        '${allParticipants[index].email}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 21, 121, 133),
                        ),
                      ),
                      value: allParticipants[index].isCheck,
                      onChanged: (bool? val) {
                        itemChange(val, index);
                      },
                    ),
                  );
                },
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send_sharp),
                  label: const Text("Submit"))
            ],
          );
        } else {
          return const Text("Ca marche pas");
        }
      }),
    );
  }
}
