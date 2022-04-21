import 'package:flutter/material.dart';
import 'package:mobile/page/listeProduit.dart';
import 'package:mobile/widget/check_participants.dart';

class GestionResa extends StatefulWidget {
  const GestionResa({Key? key, required this.title}) : super(key: key);
  final String title;

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
<<<<<<< HEAD:lib/page/gestion_resa.dart
                  // Tab(
                  //   icon: Icon(Icons.medical_services_outlined),
                  //   text: "Covid",
                  // )
=======
                  Tab(
                    icon: Icon(
                      Icons.medical_services_outlined,
                      color: Color.fromARGB(255, 254, 200, 22),
                    ),
                    text: "Covid",
                  )
>>>>>>> 13557ab9ded37fde239246ea5d1b439d79edce4f:lib/home/gestion_resa.dart
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(child: CheckParticipants(idResa: args['idResa'])),
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
