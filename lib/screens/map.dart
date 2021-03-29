import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'BloodBankProfile.dart';
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
class bankmap extends StatefulWidget {
  final double lat;///current postion latitud
 final String uid;
 final double long;///current pos longtuid
bankmap({Key key,@required this.lat,@required this.long,@required this.uid}): super(key: key);
  @override
  _bankmapState createState() => _bankmapState();
}



class _bankmapState extends State<bankmap> {
 
Set<Marker> _markers = Set<Marker>();
GoogleMapController mapController;
 //final LatLng _center = const LatLng(45.521563, -122.677433);
void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(

      stream: Firestore.instance
                .collection('Cairo')
                .document('zwELEPswrqfj91L3z1KbaX6wf6K2')
                .snapshots(),
      builder:   (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("Loading");
              }

              var userDocument = snapshot.data;
              _markers.add(new Marker(
                markerId:MarkerId('1'),
                icon: BitmapDescriptor.defaultMarker,
                position: new LatLng(userDocument['Location'].latitude, userDocument['Location'].longitude)

                ),

                );
                   return  GoogleMap(
          //compassEnabled: true,
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
           target:new LatLng(widget.lat,widget.long ),
            zoom: 17.0,
            
          ),
         markers:_markers
        );
              
      }
      
    );
  }
}