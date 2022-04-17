import 'package:flutter/material.dart';
import 'package:mobile/utils/requester.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String pwd;
  late String email;
  @override
  Widget build(BuildContext context) {
    handleLogin() async {
      var _login = await Requester.postRequest(
          "/flutter/login", {"email": email, "password": pwd});
      Map<dynamic, dynamic> result = _login as Map<dynamic, dynamic>;

      if (result.isNotEmpty) {
        Navigator.pushNamed(context, '/reservations',
            arguments: {"userId": result['id']});
      }
    }

    return Form(
      key: _formKey,
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
                onPressed: handleLogin,
              ),
            )
          ],
        ),
      ),
    );
  }
}
