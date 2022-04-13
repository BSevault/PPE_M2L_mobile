import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'requester.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//Creating a class user to store the data;
class User {
  final int id;
  final String nom;

  User({
    required this.id,
    required this.nom,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

  // Future<List<User>> getRequest() async {
  //   //replace your restFull API here.
  //   String url = "http://10.0.2.2:3001/users";

  //   Map<String, String> _headers = {
  //     "Content-Type": "application/json; charset=UTF-8",
  //   };

  //   final response = await http.get(Uri.parse(url), headers: _headers);

  //   var responseData = json.decode(response.body)["success"];

  //   //Creating a list to store input data;
  //   List<User> users = [];
  //   for (var singleUser in responseData) {
  //     User user = User(
  //       id: singleUser["id"],
  //       nom: singleUser["nom"],
  //     );

  //     //Adding user to the list.
  //     users.add(user);
  //   }
  //   return users;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Http Get Request."),
          leading: Icon(
            Icons.get_app,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: Requester.getRequest('/users'),
            // future: BaseAPI.api(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                List<User> users = [];
                for (var singleUser in snapshot.data) {
                  User user = User(
                    id: singleUser["id"],
                    nom: singleUser["nom"],
                  );

                  //Adding user to the list.
                  users.add(user);
                }
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(users[index].nom),
                    subtitle: Text(users[index].id.toString()),
                    contentPadding: EdgeInsets.only(bottom: 20.0),
                    // return ListView.builder(
                    //   itemCount: snapshot.data.length,
                    //   itemBuilder: (ctx, index) => ListTile(
                    //     title: Text(snapshot.data[index].nom),
                    //     subtitle: Text(snapshot.data[index].id.toString()),
                    //     contentPadding: EdgeInsets.only(bottom: 20.0),
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
