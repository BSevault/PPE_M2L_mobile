import 'package:flutter/material.dart';
import 'package:mobile/utils/requester.dart';
import 'package:mobile/widget/card_parti_covid.dart';
import 'package:mobile/widget/card_participant.dart';
import '../utils/class_participants.dart';

// ignore: must_be_immutable
class CheckPartiCovid extends StatefulWidget {
  CheckPartiCovid({
    Key? key,
    required this.userId,
  }) : super(key: key);
  int? userId;

  @override
  State<CheckPartiCovid> createState() => _CheckPartiCovidState();
}

class _CheckPartiCovidState extends State<CheckPartiCovid>
    with AutomaticKeepAliveClientMixin {
  // ignore: prefer_typing_uninitialized_variables
  var dataFetched;

  @override
  void initState() {
    super.initState();
    print('tried to call flutter with userid: ${widget.userId}');
    dataFetched = Requester.getRequest(
        '/flutter/${widget.userId}/participations/history');
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
          var allParticipations = snapshot.data as List;
          Color colorCard = const Color.fromARGB(255, 241, 237, 187);

          void itemChange(bool? val, int index) {
            setState(() {
              allParticipations[index].isCheck = val;
              // print(allParticipants[index].isCheck);
            });
          }

          return ListView(
            children: [
              CardPartiCovid(
                allParticipations: allParticipations,
                itemChange: itemChange,
                colorCard: colorCard,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(100, 0, 100, 70),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // update covid state here
                    // Participants.checkParticipants(
                    //     allParticipants, widget.idResa, widget.userIdResa);
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
