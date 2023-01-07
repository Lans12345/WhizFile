import 'dart:async';

import 'package:files_tracking/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DropPointPage extends StatefulWidget {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.8797, 121.7740),
    zoom: 6,
  );

  @override
  State<DropPointPage> createState() => _DropPointPageState();
}

class _DropPointPageState extends State<DropPointPage> {
  @override
  void initState() {
    super.initState();
    addMarker();
    addMarker1();
    addMarker3();
    addMarker4();
    addMarker5();
    addMarker6();
    addMarker7();
    addMarker8();
    addMarker9();
    addMarker10();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Set<Marker> _marker = <Marker>{};

  addMarker() {
    var sourcePosition = LatLng(14.602194, 120.986649);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 1',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker1() {
    var sourcePosition = LatLng(14.301797, 121.486062);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 2',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker3() {
    var sourcePosition = LatLng(16.653116, 121.509408);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 3',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker4() {
    var sourcePosition = LatLng(7.194727, 125.510836);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 4',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker5() {
    var sourcePosition = LatLng(8.468111, 124.675875);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 5',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker6() {
    var sourcePosition = LatLng(15.440074, 120.609362);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 6',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker7() {
    var sourcePosition = LatLng(13.597566, 123.232348);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 7',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker8() {
    var sourcePosition = LatLng(12.696238, 121.433337);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 8',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker9() {
    var sourcePosition = LatLng(10.547158, 123.942703);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 9',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker10() {
    var sourcePosition = LatLng(11.838615, 124.955882);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Drop Point 10',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          markers: _marker,
          mapType: MapType.normal,
          initialCameraPosition: DropPointPage._kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Card(
          child: Container(
            child: ListTile(
              leading: Icon(
                Icons.location_on_rounded,
                color: Colors.white,
              ),
              title:
                  TextBold(text: 'Location', fontSize: 14, color: Colors.white),
            ),
            height: 50,
            width: double.infinity,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }
}
