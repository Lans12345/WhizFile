import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:files_tracking/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackPage extends StatelessWidget {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.8797, 121.7740),
    zoom: 6,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Card(
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.teal,
            child: ListTile(
              leading: const Icon(
                Icons.delivery_dining_rounded,
                color: Colors.white,
              ),
              title: TextBold(
                  text: 'Track my Order', fontSize: 14, color: Colors.white),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            width: double.infinity,
            color: Colors.grey[100],
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Orders')
                    .where('uid',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                  return ListView.builder(
                      itemCount: snapshot.data?.size ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: GestureDetector(
                            onTap: (() {}),
                            child: Card(
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  title: TextBold(
                                      text: 'File Name',
                                      fontSize: 12,
                                      color: Colors.black),
                                  subtitle: TextBold(
                                      text: 'Date',
                                      fontSize: 9,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
                }),
          ),
        ),
      ],
    );
  }
}
