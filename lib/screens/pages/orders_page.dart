import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:files_tracking/services/cloud_function/add_order.dart';
import 'package:files_tracking/widgets/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../widgets/text_widget.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
    getLocation();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  late String documentType;

  late String deliveryAddress;

  late String courier;

  double lat = 0;
  double long = 0;

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: (() {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SizedBox(
                        height: 320,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Document Type'),
                                onChanged: (input) {
                                  documentType = input;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Delivery Address'),
                                onChanged: (input) {
                                  deliveryAddress = input;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: TextFormField(
                                decoration:
                                    const InputDecoration(labelText: 'Courier'),
                                onChanged: (input) {
                                  courier = input;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ButtonWidget(
                                onPressed: () {
                                  addOrder(documentType, deliveryAddress,
                                      courier, lat, long);
                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: TextRegular(
                                          text: 'Order placed succesfully!',
                                          fontSize: 12,
                                          color: Colors.white),
                                    ),
                                  );
                                },
                                text: 'Place Order'),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Orders')
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .where('status', isEqualTo: 'On Process')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print('error');
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('waiting');
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return ListView.separated(
                    itemCount: snapshot.data?.size ?? 0,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.file_copy_rounded),
                        title: TextBold(
                            text: data.docs[index]['documentType'],
                            fontSize: 15,
                            color: Colors.black),
                        subtitle: TextBold(
                            text: data.docs[index]['date'],
                            fontSize: 12,
                            color: Colors.grey),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: const Text(
                                        'Are you sure you want to label this order as completed?',
                                        style:
                                            TextStyle(fontFamily: 'QRegular'),
                                      ),
                                      actions: <Widget>[
                                        MaterialButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                fontFamily: 'QRegular',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () async {
                                            // update
                                            FirebaseFirestore.instance
                                                .collection('Orders')
                                                .doc(data.docs[index].id)
                                                .update(
                                                    {'status': 'Completed'});
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: TextRegular(
                                                    text: 'Order completed!',
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            );
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
                          icon: const Icon(
                            Icons.check_circle_outline_rounded,
                            color: Colors.teal,
                          ),
                        ),
                      );
                    });
              }),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Orders')
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .where('status', isEqualTo: 'Completed')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print('error');
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('waiting');
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return ListView.separated(
                    itemCount: snapshot.data?.size ?? 0,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.file_copy_rounded),
                        title: TextBold(
                            text: data.docs[index]['documentType'],
                            fontSize: 15,
                            color: Colors.black),
                        subtitle: TextBold(
                            text: data.docs[index]['date'],
                            fontSize: 12,
                            color: Colors.grey),
                      );
                    });
              }),
        ]),
      ),
    );
  }
}
