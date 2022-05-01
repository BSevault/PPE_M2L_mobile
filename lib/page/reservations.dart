import 'package:flutter/material.dart';
import 'package:mobile/utils/requester.dart';
import 'package:mobile/widget/card_resa.dart';

// ignore: must_be_immutable
class Reservations extends StatefulWidget {
  const Reservations({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return FutureBuilder(
      future: Requester.getRequest('/flutter/${args['userId']}/reservations'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var resa = snapshot.data as List;
          return DefaultTabController(
            length: 2,
            // The Builder widget is used to have a different BuildContext to access
            // closest DefaultTabController.
            child: Builder(
              builder: (BuildContext context) {
                final TabController tabController =
                    DefaultTabController.of(context)!;
                tabController.addListener(() {
                  if (!tabController.indexIsChanging) {
                    // print(tabController.index);
                    // Your code goes here.
                    // To get index of current tab use tabController.index
                  }
                });

                return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                    bottom: const TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.check,
                            color: Color.fromARGB(255, 254, 200, 22),
                          ),
                          text: "Réservations",
                        ),
                        Tab(
                          icon: Icon(Icons.medical_services_outlined,
                              color: Color.fromARGB(255, 254, 200, 22)),
                          text: "Covid",
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...(resa[0] as List).map(
                              (oneResa) {
                                // print(oneResa);
                                return CardResa(
                                    oneResa: oneResa,
                                    userIdResa: args['userId']);
                              },
                            ),
                          ],
                        ),
                      ),
                      const Center(child: Text('covidPage')),
                      // const Center(child: Text("Covid")),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return DefaultTabController(
            length: 2,
            // The Builder widget is used to have a different BuildContext to access
            // closest DefaultTabController.
            child: Builder(
              builder: (BuildContext context) {
                final TabController tabController =
                    DefaultTabController.of(context)!;
                tabController.addListener(() {
                  if (!tabController.indexIsChanging) {
                    // print(tabController.index);
                    // Your code goes here.
                    // To get index of current tab use tabController.index
                  }
                });

                return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                    // automaticallyImplyLeading: false,
                    bottom: const TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.check,
                            color: Color.fromARGB(255, 254, 200, 22),
                          ),
                          text: "Réservations",
                        ),
                        Tab(
                          icon: Icon(Icons.medical_services_outlined,
                              color: Color.fromARGB(255, 254, 200, 22)),
                          text: "Covid",
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
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Vous n'avez pas de réservations en cours...",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const Center(child: Text('covidPage')),
                      // const Center(child: Text("Covid")),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
// {}
// {}
// {}
// {}
// {}
//   {}
//   {}
//   {}
//   {}
//   {}
//   {}
//     {}
//     {}
//     {} 
//     {}
//       {}
//       {}
//       {}
//       {}
//       {}
//         {}
//         {}
//         {}
//         {}
//         {}
//       {}
//       {}
//       {}
//     {}
//     {}
//     {}
//       {}
//       {}
//       {}
//         {}
//         {}
//         {}
//         {}
//           {}
//           {}
//           {}

// sss i'm a snake