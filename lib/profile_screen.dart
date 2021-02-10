import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:real_estate_demo/with_location_filter_dialog.dart';

class ProfileScreen extends StatefulWidget {
  List photos, bedroomlist, bathroomlist;
  String bedrooms, bathrooms, size, image, otherrooms, price;
  ProfileScreen(this.photos, this.bathrooms, this.bedrooms, this.bedroomlist,
      this.bathroomlist, this.size, this.image, this.otherrooms, this.price);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
String text =
    'From the outside this house looks stylish. It has been built with cypress wood andhas red brick decorations From the outside this house looks stylish. It has been built with cypress wood andhas red brick decorations';
String firsttext = text.substring(0, 107) + '...';
Widget icon1 = Icon(Icons.more);
Widget empty = Container();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Widget _buildcards(IconData icon, String number, String type) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          child: Container(
            width: 130,
            height: 80,
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(icon),
                    Text(number,
                        style: GoogleFonts.viga(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                Text(type,
                    style: GoogleFonts.dekko(
                        fontWeight: FontWeight.normal, fontSize: 18)),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 400,
              child: Stack(
                children: [
                  Image.network(
                    widget.image,
                    width: 411,
                    height: 375,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 55,
                    left: 5,
                    child: GestureDetector(
                        child: Icon(Icons.arrow_back, color: Colors.white),
                        onTap: () => Navigator.of(context).pop()),
                  ),
                  Positioned(
                    top: 150,
                    left: 150,
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Color(0xffECEAEA),
                        height: 30,
                        child: Center(
                          child: Text('TAKE A TOUR',
                              style: GoogleFonts.viga(
                                  color: Color(0xff4B4040),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Details(
                                widget.photos,
                                widget.bathrooms,
                                widget.bedrooms,
                                widget.bedroomlist,
                                widget.bathroomlist)));
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          color: Colors.transparent,
                          height: 80,
                          width: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Color(0xffECEAEA),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.bookmark_border,
                                      )),
                                  Text('Save',
                                      style: GoogleFonts.dekko(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18))
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Color(0xffECEAEA),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Elusive.share,
                                      )),
                                  Text('Share',
                                      style: GoogleFonts.dekko(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18))
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Color(0xffECEAEA),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        FontAwesome5.map_marker_alt,
                                      )),
                                  Text('On Map',
                                      style: GoogleFonts.dekko(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18))
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Color(0xffECEAEA),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.network(
                                        'https://img.icons8.com/ios-filled/25/000000/google-nearby.png',
                                      )),
                                  Text('Nearby',
                                      style: GoogleFonts.dekko(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Captivating bungalow house for the single farming modern farmhouses in tanzania',
                maxLines: 2,
                style: GoogleFonts.hammersmithOne(
                    color: Color(0xff686868),
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    "https://img.icons8.com/ios-filled/20/000000/price-tag.png",
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Tzs' + ' ' + widget.price,
                      style: TextStyle(
                          fontFamily: 'BalsamiqSans-Regular',
                          color: Color(0xff423D04),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Wrap(
              children: [
                _buildcards(Icons.king_bed, widget.bedrooms, 'Bedrooms'),
                _buildcards(FontAwesome5.bath, widget.bathrooms, 'Bathrooms'),
                _buildcards(
                    Icons.photo_size_select_large, widget.size, 'size /sq.ft'),
                _buildcards(Typicons.th_large, widget.otherrooms, 'All rooms')
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Description',
                    maxLines: 2,
                    style: GoogleFonts.doHyeon(
                        color: Color(0xffB49734),
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            text.length > 107
                ? Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(firsttext,
                            style: GoogleFonts.dekko(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                      ),
                      Positioned(
                          bottom: 12,
                          left: 130,
                          child: GestureDetector(
                            child: icon1,
                            onTap: () {
                              setState(() {
                                firsttext = text;
                                icon1 = empty;
                              });
                            },
                          ))
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text,
                        style: GoogleFonts.dekko(
                            fontWeight: FontWeight.normal, fontSize: 20)),
                  ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Property Agent',
                    maxLines: 2,
                    style: GoogleFonts.doHyeon(
                        color: Color(0xffB49734),
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/236x/26/24/12/262412a39f7f6b3aaafde9bf3b3c0027.jpg',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'James Hundogan',
                          maxLines: 2,
                          style: GoogleFonts.dekko(
                              //color: Color(0xff464104),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xffD3D3D3),
                    child: Icon(Icons.call, color: Color(0xff1A3651)),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xffD3D3D3),
                    child: Icon(FontAwesome.chat, color: Color(0xff1A3651)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
