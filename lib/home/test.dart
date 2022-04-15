import 'package:flutter/material.dart';
import '../requester.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Http Get Request."),
          leading: const Icon(
            Icons.get_app,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            // future: Requester.getRequest('/flutter/1/reservations'),
            // future: Requester.getRequest('/flutter/1/reservations/history'),
            future: Requester.postRequest('/flutter/login',
                {"email": "test1@email.com", "password": "test1"}),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                /* The listTile accept a list, data for test must be a list */
                var users = [snapshot.data];
                // var users = snapshot.data[0];
                print(users);
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(users[index]['nom']),
                    // subtitle: Text(users[index]['is_covid'] == 1
                    //     ? 'Is covid'
                    //     : 'Not covid'),
                    contentPadding: const EdgeInsets.only(bottom: 20.0),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
