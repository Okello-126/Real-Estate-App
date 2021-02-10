import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../withoutlocationcard.dart';

class Favourites extends StatefulWidget {
  Favourites({Key key}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

List<Widget> favorites = [];

class _FeaturedState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          'FAVOURITES',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.filter_list, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('dummy').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              DocumentSnapshot property = snapshot.data.docs[index];

              if (snapshot.hasData == null) {
                return Text('nothing on the database');
              }
              if (snapshot.connectionState == ConnectionState.none) {
                return Text('no connection');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {}

              return WithoutLocationCard(
                  property['bedrooms'],
                  property['bathrooms'],
                  property['price'],
                  property['street'] + ', ' + property['district'],
                  property['title'],
                  property['image'],
                  property['other rooms'],
                  property['photos'],
                  property['bedroomslist'],
                  property['bathroomlist'],
                  property['size']);
            },
          );
        },
      )),
    );
  }
}
