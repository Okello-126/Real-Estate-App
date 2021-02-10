import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate_demo/withoutlocationcard.dart';
//import 'package:fluttericon/font_awesome5_icons.dart';


class DummyPage extends StatefulWidget {
  final collection;
  final transaction;

  DummyPage(this.collection, this.transaction);

  @override
  _DummyPageState createState() => _DummyPageState();
}




class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // key: _scaffoldkey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            SizedBox(
              width: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.clear_all, color: Colors.black),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
            )
          ],
        ),

        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: widget.collection,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot property = snapshot.data.docs[index];
                  return WithoutLocationCard(
                    property['bedrooms'],
                    property['bathrooms'],
                    widget.transaction == 'RENT'
                        ? property['price'] + '\ /m'
                        : property['price'],
                    property['street'] + ', ' + property['district'],
                    property['title'],
                    property['image'],
                      property['other rooms'],
                    property['photos'],property['bedroomslist'],property['bathroomlist'],property['size']
                  );
                },
              );
            },
          ),
        ),

    
      ),
    );
  }
}
