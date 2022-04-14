import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile/home/test.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/participant');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.check),
          label: 'Participants',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank_sharp),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services_sharp),
          label: 'Covid',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.lightGreen,
      onTap: _onItemTapped,
    );
  }
}
