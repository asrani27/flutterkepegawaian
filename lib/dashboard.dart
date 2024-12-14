import 'package:flutter/material.dart';
import 'package:pertemuanke2/login.dart';
import 'package:get/get.dart';
import 'package:pertemuanke2/pages/calendar.dart';
import 'package:pertemuanke2/pages/home.dart';
import 'package:pertemuanke2/pages/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Profile(),
    Calendar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple])),
        ),
        title: Text(
          'DASHBOARD',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              Get.defaultDialog(
                  title: 'Ingin Keluar Aplikasi?',
                  content: Container(),
                  textConfirm: 'Ya',
                  textCancel: 'Tidak',
                  onConfirm: () {
                    Get.offAll(login());
                  },
                  onCancel: () {
                    print('tidak');
                  });
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
          ]),
    );
  }
}
