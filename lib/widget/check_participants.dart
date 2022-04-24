import 'package:flutter/material.dart';
import 'package:mobile/widget/card_participant.dart';
import '../utils/class_participants.dart';

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
          Color colorCard = const Color.fromARGB(255, 241, 237, 187);

          void itemChange(bool? val, int index) {
            setState(() {
              allParticipants[index].isCheck = val;
              // print(allParticipants[index].isCheck);
            });
          }

          return ListView(
            children: [
              CardParticipants(
                allParticipants: allParticipants,
                itemChange: itemChange,
                colorCard: colorCard,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(100, 0, 100, 70),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Participants.checkParticipants(
                        allParticipants, widget.idResa, widget.userIdResa);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Liste d\'appel mis à jour !',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        duration: Duration(milliseconds: 2500),
                      ),
                    );
                  },
                  icon: const Icon(Icons.send_sharp),
                  label: const Text("Enregistrer"),
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
