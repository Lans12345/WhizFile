import 'package:files_tracking/screens/pages/main_page.dart';
import 'package:files_tracking/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [const MainPage(), const MainPage(), const MainPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title:
            TextRegular(text: 'While File', fontSize: 24, color: Colors.white),
      ),
      body: SafeArea(child: tabs[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        iconSize: 25,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.file_present_outlined,
                color: Colors.white,
              ),
              backgroundColor: Colors.teal,
              label: 'My Order'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.monetization_on,
                color: Colors.white,
              ),
              backgroundColor: Colors.teal,
              label: 'Rates'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_history,
                color: Colors.white,
              ),
              backgroundColor: Colors.teal,
              label: 'Nearby'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.teal,
              label: 'Me'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
