import 'dart:async';

import 'package:files_tracking/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DropPointPage extends StatelessWidget {
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
