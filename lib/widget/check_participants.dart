import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/class_participants.dart';
import '../utils/requester.dart';

// ignore: must_be_immutable
class CheckParticipants extends StatefulWidget {
  CheckParticipants(
      {Key? key,
      required this.idResa,
      required this.checkParticipants,
      required this.userIdResa})
      : super(key: key);
  int? idResa;
  int? checkParticipants;
  int? userIdResa;

  @override
  State<CheckParticipants> createState() => _CheckParticipantsState();
}

class _CheckParticipantsState extends State<CheckParticipants>
    with AutomaticKeepAliveClientMixin {
  // ignore: prefer_typing_uninitialized_variables
  var dataFetched;
  late String _sendtext = "";

  @override
  void initState() {
    super.initState();
    dataFetched = Participants.getParticipants(widget.idResa);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
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

          if (_sendtext.isNotEmpty) {
            Timer(const Duration(seconds: 5), (() {
              setState(() {
                _sendtext = "";
              });
            }));
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
                      secondary: const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 21, 121, 133),
                        size: 40,
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
                onPressed: () async {
                  allParticipants.forEach((participant) async {
                    await Requester.putRequest(
                        '/flutter/${widget.idResa}/participants', {
                      "id_user": participant.userId,
                      "is_present": participant.isCheck
                    });
                  });
                  await Requester.putRequest(
                    '/flutter/${widget.userIdResa}/reservations',
                    {"id_resa": '${widget.idResa}'},
                  );
                  setState(() {
                    _sendtext = "Checklist mise à jour";
                    widget.checkParticipants = 1;
                  });
                },
                icon: const Icon(Icons.send_sharp),
                label: const Text("Enregistrer"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Text(
                  _sendtext,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Text("Ca marche pas");
        }
      }),
    );
  }
}
