import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate_demo/filterforlocation.dart';

import 'notification.dart';

class AtLocation extends StatefulWidget {
  final String text;

  AtLocation(this.text);

  @override
  _AtLocationState createState() => _AtLocationState();
}

List<int> listtype = [0, 1];
List<int> whatfor = [0, 1];
int selectedcard, selectedcontainer;
String chosentype, chosenfor, transaction;
FilterForLocation filter = FilterForLocation();

class _AtLocationState extends State<AtLocation> {
  @override
  Widget build(BuildContext context) {
    String letter = widget.text.substring(0, 1);
    String otherletters = widget.text.substring(1);
    return Container(
      child: Scaffold(
          body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/Image%203.png?alt=media&token=d188f306-9f48-461f-b396-ef4bb8f74f45',
                width: 411,
                height: 372,
              ),
              Positioned(
                bottom: 5,
                left: 5,
                child: Text(
                  'At  ' + letter.toUpperCase() + otherletters,
                  style: GoogleFonts.dekko(
                      fontWeight: FontWeight.normal,
                      fontSize: 24,
                      color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'Looking for ',
                style: GoogleFonts.dekko(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            children: [
              SizedBox(
                height: 42,
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedcard = index;

                          chosentype =
                              selectedcard == 0 ? 'houses' : 'apartments';
                        });
                      },
                      child: Card(
                          elevation: 5,
                          child: Container(
                            color: selectedcard == index
                                ? Colors.blue
                                : Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(index == 0 ? 'HOUSES' : 'APARTMENTS',
                                style: GoogleFonts.doHyeon(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                )),
                          )),
                    );
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Wrap(
            children: [
              SizedBox(
                height: 45,
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedcontainer = index;
                            chosenfor = selectedcontainer == 0
                                ? '-for-sale'
                                : '-for-rent';
                            transaction =
                                selectedcontainer == 0 ? 'SALE' : 'RENT';

                            searchinglocations.type = chosentype;
                            searchinglocations.whatfor = chosenfor;
                          });

                          print(chosentype + chosenfor);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationsScreen(
                                    FirebaseFirestore.instance
                                        .collection(chosentype + chosenfor)
                                        .where('street',
                                            isEqualTo: widget.text),
                                    transaction,
                                    widget.text,
                                    searchinglocations.type,
                                    searchinglocations.whatfor),
                              ));
                        },
                        child: Card(
                            elevation: 5,
                            child: Container(
                              color: selectedcontainer == index
                                  ? Colors.blue
                                  : Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(index == 0 ? 'for sale' : 'for rent',
                                  style: GoogleFonts.dekko(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  )),
                            )),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
