import 'package:flutter/material.dart';
import 'package:mobile/widget/bottom_nav.dart';

class Template extends StatefulWidget {
  const Template({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello ${widget.title}'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
