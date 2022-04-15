import 'package:flutter/material.dart';

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
    // if (index == 0) {
    //   Navigator.pushNamed(context, '/template');
    // }
    switch (index) {
      case 0:
        {
          Navigator.pushNamed(context, '/participant');
          break;
        }
      case 1:
        {
          Navigator.pushNamed(context, '/services');
          break;
        }
      case 2:
        {
          Navigator.pushNamed(context, '/covid');
          break;
        }
      default:
        {
          Navigator.pushNamed(context, '/');
          break;
        }
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
      selectedItemColor: const Color(0xFF068D9D),
      onTap: _onItemTapped,
    );
  }
}
