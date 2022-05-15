import 'package:flutter/material.dart';
import 'AdminPage.dart';
import 'passwordchange.dart';
import 'AddStudent.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends  State<BottomNavBar>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    AdminHome(),
    StudentAdd(),
    ChangePasswordWidget()
  ];

  void onTappedItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedItem,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Examen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Studenten',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Wachtwoord wijzigen',
          ),
        ],
      ),
    );
  }
}