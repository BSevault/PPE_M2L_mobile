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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            // future: Requester.getRequest('/flutter/1/reservations'),
            future: Requester.postRequest('/flutter/login',
                {"email": "test1@email.com", "password": "test1"}),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                // var users = snapshot.data[0];
                var users = [snapshot.data];
                print(users);
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(users[index]['nom']),
                    subtitle: Text(users[index]['id'].toString()),
                    contentPadding: EdgeInsets.only(bottom: 20.0),
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
