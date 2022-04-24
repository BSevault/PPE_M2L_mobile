import 'package:flutter/material.dart';
import 'package:mobile/page/listeProduit.dart';
import 'package:mobile/widget/check_participants.dart';

class GestionResa extends StatefulWidget {
  const GestionResa({Key? key}) : super(key: key);

  @override
  State<GestionResa> createState() => _GestionResaState();
}

class _GestionResaState extends State<GestionResa> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    // print(args);
    return DefaultTabController(
      length: 2,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // print(tabController.index);
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });

          return Scaffold(
            appBar: AppBar(
              title: Text('${args['titre']}'),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.check,
                      color: Color.fromARGB(255, 254, 200, 22),
                    ),
                    text: "Participants",
                  ),
                  Tab(
                    icon: Icon(Icons.food_bank_outlined,
                        color: Color.fromARGB(255, 254, 200, 22)),
                    text: "Services",
                  ),
                  // Tab(
                  //   icon: Icon(Icons.medical_services_outlined),
                  //   text: "Covid",
                  // )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: CheckParticipants(
                      idResa: args['idResa'],
                      checkParticipants: args['checkParticipants'],
                      userIdResa: args['userIdResa']),
                ),
                const Center(child: ListeProduit()),
                // const Center(child: Text("Covid")),
              ],
            ),
          );
        },
      ),
    );
  }
}
