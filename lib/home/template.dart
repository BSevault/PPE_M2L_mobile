import 'package:flutter/material.dart';
import 'package:mobile/widget/bottom_nav.dart';
import 'package:mobile/widget/check_list_participants.dart';

class Template extends StatefulWidget {
  const Template({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args);
    return DefaultTabController(
      length: 3,
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
                      icon: Icon(Icons.check),
                      text: "Participants",
                    ),
                    Tab(
                      icon: Icon(Icons.food_bank_outlined),
                      text: "Services",
                    ),
                    Tab(
                      icon: Icon(Icons.medical_services_outlined),
                      text: "Covid",
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Center(child: CheckParticipants(idResa: args['idResa'])),
                  const Center(child: Text("Services")),
                  const Center(child: Text("Covid")),
                ],
              )
              // bottomNavigationBar: BottomNavBar(),
              );
        },
      ),
    );
  }
}
