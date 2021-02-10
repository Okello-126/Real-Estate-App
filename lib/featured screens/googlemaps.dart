import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../profile_screen.dart';

class Maps extends StatefulWidget {
  final collection, transaction;
  Maps(this.collection, this.transaction);

  @override
  _MapsState createState() => _MapsState();
}

List<double> listoflatitudes = [
  -6.776435,
  -6.774131,
  -6.810180,
  -6.805802,
  -6.762555,
  -6.768229,
  -6.786184,
  -6.800660,
  -6.801107,
  -6.789817,
  -6.76189
];

Completer<GoogleMapController> _controller = Completer();
BitmapDescriptor okelo = BitmapDescriptor.defaultMarker;

Future<void> gotolocation1(double lat, double long) async {
  final GoogleMapController controller = await _controller.future;

  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long), zoom: 15, tilt: 50.0, bearing: 45.0)));
}

class _MapsState extends State<Maps> {
  List<Marker> markers = [];

  gotolocation(double lat, double long) {
    setState(() {
      markers = [];
      markers.add(Marker(
          markerId: MarkerId('properties'),
          position: LatLng(lat, long),
          icon: okelo));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(-6.8043904, 39.2162473), zoom: 14),
            mapType: MapType.normal,
            markers: Set.from(markers),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            /*       markers: {
              marker1,
              marker2,
              marker3,
              marker4,
              marker5,
              marker6,
              marker8,
              marker7,
              marker9,
              marker10,
              marker11
            }, */
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: StreamBuilder(
                stream: widget.collection.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  return Container(
                    height: 201,
                    child: ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        DocumentSnapshot property = snapshot.data.docs[index];

                        return Card(
                          child: GestureDetector(
                            onTap: () {
                              gotolocation1(
                                  property['latitude'], property['longitude']);

                              gotolocation(
                                  property['latitude'], property['longitude']);
                              /*  if (listoflatitudes
                                  .contains(property['latitude'])) {
                                print('yeah got it');
                                setState(() {
                                  okelo = BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueGreen);
                                });
                              } */
                            },
                            child: Container(
                              width: 380,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              height: 201,
                              child: Stack(
                                children: [
                                  Image.network(property['image'],
                                      width: 380,
                                      height: 201,
                                      fit: BoxFit.fill),
                                  Positioned(
                                    left: 3,
                                    top: 3,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xff45423D),
                                      ),
                                      child: Icon(CupertinoIcons.bookmark,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Positioned(
                                    right: 3,
                                    top: 3,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileScreen(
                                                      property['photos'],
                                                      property['bathrooms'],
                                                      property['bedrooms'],
                                                      property['bedroomslist'],
                                                      property['bathroomlist'],
                                                      property['size'],
                                                      property['image'],
                                                      property['other rooms'],
                                                      property['price']),
                                            ));
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color(0xff45423D),
                                          ),
                                          child: Image.network(
                                              'https://img.icons8.com/material-rounded/24/000000/details.png',
                                              color: Colors.white)),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 5,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffE2E3DD),
                                      ),
                                      child: Text('Tzs ' + property['price'],
                                          style: GoogleFonts.dekko(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 10,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: 110,
                                      // height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffE2E3DD),
                                      ),
                                      child: Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(Icons.king_bed,
                                                  size: 28,
                                                  color: Colors.black54),  SizedBox(width: 5),
                                              Text(property['bedrooms'],
                                                  style: GoogleFonts.dekko(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                              SizedBox(width: 10),
                                              Icon(FontAwesome5.bath,
                                                  size: 18,
                                                  color: Colors.black54),  SizedBox(width: 5),
                                              Text(property['bathrooms'],
                                                  style: GoogleFonts.dekko(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black))
                                            ]),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

Marker marker2 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.776435, 39.278731),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker1 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.774131, 39.272025),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker3 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.810180, 39.279410),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker4 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.805802, 39.277361),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker5 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.762555, 39.272055),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker6 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.768229, 39.242287),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker7 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.761890, 39.243467),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker8 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.789817, 39.275299),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker9 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.786184, 39.276973),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker10 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.800660, 39.275486),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);

Marker marker11 = Marker(
    markerId: MarkerId('sinza'),
    position: LatLng(-6.801107, 39.274724),
    infoWindow: InfoWindow(title: 'hello there'),
    icon: okelo);
