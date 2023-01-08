import 'package:files_tracking/screens/pages/drop_point_page.dart';
import 'package:files_tracking/screens/pages/orders_page.dart';
import 'package:files_tracking/screens/pages/rates_page.dart';
import 'package:files_tracking/screens/pages/track_page.dart';
import 'package:files_tracking/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/login_page.dart.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal),
                width: double.infinity,
                height: 150,
                child: Center(
                  child: TextBold(
                    text: 'Ads Section',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (() {
                    setState(() {
                      _currentIndex = 1;
                    });
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal),
                    width: 150,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextBold(
                              text: 'Order',
                              fontSize: 24,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextBold(
                              text: 'Create Order',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 4;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal),
                    width: 150,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextBold(
                              text: 'Tracking',
                              fontSize: 24,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextBold(
                              text: 'Track your Order',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: ListTile(
                        leading: const Icon(Icons.discount),
                        title: TextRegular(
                            text: 'Vouchers',
                            fontSize: 14,
                            color: Colors.black),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      OrdersPage(),
      const RatesPage(),
      DropPointPage(),
      TrackPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text(
                          'Logout Confirmation',
                          style: TextStyle(
                              fontFamily: 'QBold', fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Are you sure you want to Logout?',
                          style: TextStyle(fontFamily: 'QRegular'),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title:
            TextRegular(text: 'WHiZ File', fontSize: 24, color: Colors.white),
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
