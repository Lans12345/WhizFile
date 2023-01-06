import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              indicatorColor: Colors.teal,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: 'On Process',
                ),
                Tab(
                  text: 'Completed',
                ),
              ]),
          centerTitle: true,
          actions: const [],
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          title:
              TextRegular(text: 'My Order', fontSize: 18, color: Colors.white),
        ),
        body: TabBarView(children: [
          Center(
            child:
                TextRegular(text: 'No data', fontSize: 18, color: Colors.black),
          ),
          Center(
            child:
                TextRegular(text: 'No data', fontSize: 18, color: Colors.black),
          ),
        ]),
      ),
    );
  }
}
