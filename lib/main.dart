import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'requester.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            future: Requester.getRequest('/flutter/1/reservations/history'),
            // future: Requester.postRequest('/flutter/login',
            //     {"email": "test1@email.com", "password": "test1"}),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // var users = snapshot.data[0];
                var users = snapshot.data[0];
                print(users);
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(users[index]['nom']),
                    subtitle: Text(users[index]['is_covid'] == 1
                        ? 'Is covid'
                        : 'Not covid'),
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
