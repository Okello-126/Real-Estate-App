import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class WithLocationCard extends StatelessWidget {
  final String bedrooms;
  final String bathrooms;
  final String price;
  final String title;
  final String image;

  WithLocationCard(
      this.bedrooms, this.bathrooms, this.price, this.title, this.image);
  @override
  Widget build(BuildContext context) {
    Widget _buildContainer(
        double height, bedrooms, bathrooms, price, title, image) {
      return Container(
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
                  fit: BoxFit.fill,
                ),

                Positioned(
                right: 5,
                top: 5,
                child: Icon(Icons.bookmark_border, color: Colors.white)),
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
                      Container(
                          width: 130,
                        //  height: 30,
                          color: Colors.white,
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
                                  Text(bedrooms,
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
                                  Text(bathrooms,
                                      style: TextStyle(
                                          fontFamily: 'BalsamiqSans-Bold',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                ],
                              )
                            ],
                          )),
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
            )
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Card(
          elevation: 3,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final span = TextSpan(
                text: title,
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
                    298, bedrooms, bathrooms, price, title, image);
              }
              if (!exceeded) {
                return _buildContainer(
                    275, bedrooms, bathrooms, price, title, image);
              }
              return Container();
            },
          )),
    );
  }
}
