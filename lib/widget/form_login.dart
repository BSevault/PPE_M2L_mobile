import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/home/test.dart';
import 'package:mobile/utils/requester.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String req;
    Map body = {};

    var pwd;
    var email;

    return Form(
      key: _formKey,
      onChanged: () => {Form.of(primaryFocus!.context!)!.save()},
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Connexion à votre compte M2L",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            TextFormField(
              onChanged: (String value) {
                setState(() {
                  email = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Il manque votre email";
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (String value) {
                setState(() {
                  pwd = value;
                });
                // debugPrint(body.toString());
              },
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Il manque votre mot de passe";
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                child: const Text("Login"),
                onPressed: () => {
                  // if (_formKey.currentState!.validate())
                  //   {
                  req = jsonEncode(body),
                  FutureBuilder(
                    future: Requester.postRequest(
                        "/flutter/login", {"email": email, "password": pwd}),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      print(jsonDecode(snapshot.data));
                      if (snapshot.data == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return const Test();
                      }
                    },
                  ),
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
