import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:real_estate_demo/profile_screen.dart';

class WithoutLocationCard extends StatefulWidget {
  final String bedrooms;
  final String bathrooms;
  final String price;
  final String location;
  final String title;
  final String image;
  final String otherRooms, size;
  final List photos, bedroomlist, bathroomlist;

  WithoutLocationCard(
      this.bedrooms,
      this.bathrooms,
      this.price,
      this.location,
      this.title,
      this.image,
      this.otherRooms,
      this.photos,
      this.bedroomlist,
      this.bathroomlist,
      this.size);

  @override
  _WithoutLocationCardState createState() => _WithoutLocationCardState();
}

class _WithoutLocationCardState extends State<WithoutLocationCard> {
  @override
  Widget build(BuildContext context) {
    String letter = widget.location.substring(0, 1);
    String otherletters = widget.location.substring(1);
    Widget _buildContainer(double height, bedrooms, bathrooms, price, location,
        title, image, photos) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(
                    photos,
                    bathrooms,
                    bedrooms,
                    widget.bedroomlist,
                    widget.bathroomlist,
                    widget.size,
                    image,
                    widget.otherRooms,
                    price),
              ));
        },
        child: Center(
          child: Container(
            width: 394,
            height: height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      image,
                      width: 394,
                      height: 208,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                          width: 130,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.king_bed,
                                      color: Color(0xff463B3B), size: 27),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('$bedrooms',
                                      style: TextStyle(
                                          fontFamily: 'BalsamiqSans-Bold',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                ],
                              ),
                              SizedBox(width: 5),
                              Row(
                                children: [
                                  Icon(FontAwesome5.bath,
                                      color: Color(0xff463B3B), size: 18),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('$bathrooms',
                                      style: TextStyle(
                                          fontFamily: 'BalsamiqSans-Bold',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text('Tzs' + ' ' + price,
                        style: TextStyle(
                            fontFamily: 'BalsamiqSans-Regular',
                            color: Color(0xff423D04),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            letter.toUpperCase() + otherletters,
                            style: GoogleFonts.viga(
                                fontSize: 18, fontWeight: FontWeight.normal
                                //only normal
                                ),
                          ),
                          SizedBox(
                            width: 3,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    title,
                    maxLines: 2,
                    style: GoogleFonts.hammersmithOne(
                        color: Color(0xff686868),
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                //SizedBox(height:5)
              ],
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Card(
          elevation: 5,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final span = TextSpan(
                text: widget.title,
                style: GoogleFonts.hammersmithOne(
                    color: Color(0xff686868),
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              );
              final tp = TextPainter(
                text: span,
                maxLines: 1,
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
              );
              tp.layout(maxWidth: 300);

              List<LineMetrics> lines = tp.computeLineMetrics();
              int numberOfLines = lines.length;
              print(numberOfLines);
              var exceeded = tp.didExceedMaxLines;

              if (exceeded) {
                return _buildContainer(
                    298,
                    widget.bedrooms,
                    widget.bathrooms,
                    widget.price,
                    widget.location,
                    widget.title,
                    widget.image,
                    widget.photos);
              }
              if (!exceeded) {
                return _buildContainer(
                    275,
                    widget.bedrooms,
                    widget.bathrooms,
                    widget.price,
                    widget.location,
                    widget.title,
                    widget.image,
                    widget.photos);
              }
              return Container();
            },
          )),
    );
  }
}
