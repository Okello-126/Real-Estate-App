import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_demo/dummyforlocationtyped.dart';
import 'package:real_estate_demo/dummypagewithlocation.dart';
import 'package:real_estate_demo/managetextfield.dart';
import 'filterforlocation.dart';
import 'jhforlocation.dart';
import 'with_location_card.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsScreen extends StatefulWidget {
  var collection;
  var transaction;
  var text;
  String type, whatfor;

  NotificationsScreen(
      this.collection, this.transaction, this.text, this.type, this.whatfor);
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

//Query collectioninside = filter.collection;
final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
var _bungalowselected = Colors.black54, _bungalowscolor = Colors.white;
var _villaselected = Colors.black54, _villacolor = Colors.white;
var _descendingselected = Colors.black54, _descendingcolor = Colors.white;
var _ascendingselected = Colors.black54, _ascendingcolor = Colors.white;
var listviewselected = Colors.black54, listviewcolor = Colors.white;
var mapcviewselcted = Colors.black54, mapviewcolor = Colors.white;
int mapselected = 0, listselected = 0;
int selected = 0, villaselected = 0;
int ascendingselected = 0, descendingselected = 0;
RangeValues selectedRange = RangeValues(200000, 10000000000);

List<int> list = [0, 1, 2, 3, 4];
List<int> list1 = [0, 1, 2, 3, 4];
int selecteditem, selecteditem1;
FilterForLocation filter = FilterForLocation();
TextEditingController _controller = TextEditingController();
bool onlocationspage = true;
ManageTextfield searchinglocations = ManageTextfield();

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    showSnackBar() {
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text(
          "33 results found",
          textAlign: TextAlign.center,
          style:
              GoogleFonts.dekko(fontSize: 16.0, fontWeight: FontWeight.normal),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
      ));
    }

    Widget _buildfilter(IconData icon, double size, String filter) {
      return Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              size: size,
              //   color: Color(0xff6E6E6E),
              color: Colors.black54,
            ),
            SizedBox(
              width: 15,
            ),
            Text(filter,
                style: GoogleFonts.dekko(
                    color: Colors.black,
                    // color: Color(0xff6E6E6E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
          ],
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
            key: _scaffoldkey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xffEFF3EF),
              actions: [
                SizedBox(
                  width: 400,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: TextField(
                      controller: _controller,
                      style: GoogleFonts.dekko(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Entypo.location),
                          hintText: widget.text,
                          //  hintText: 'Location',
                          hintStyle: GoogleFonts.dekko(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          suffixIcon: Icon(Icons.search)),
                      onSubmitted: (value) {
                        setState(() {
                          searchinglocations.text = _controller.text;
                          _controller.clear();
                        });

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DummyNotificationsScreen(
                                  FirebaseFirestore.instance
                                      .collection(searchinglocations.type +
                                          searchinglocations.whatfor)
                                      .where('street',
                                          isEqualTo: searchinglocations.text),
                                  widget.transaction,
                                  searchinglocations.text,
                                  searchinglocations.type,
                                  searchinglocations.whatfor),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: StreamBuilder(
                stream: widget.collection.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      /*  if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('waiting for connection');
                      } */

                      return WithLocationCard(
                        property['bedrooms'],
                        property['bathrooms'],
                        widget.transaction == 'RENT'
                            ? property['price'] + '\ /m'
                            : property['price'],
                        property['title'],
                        property['image'],
                      );
                    },
                  );
                },
              ),
            ),
            floatingActionButton: Row(children: [
              SizedBox(
                width: 25,
              ),
              FloatingActionButton(
                elevation: 10,
                backgroundColor: Color(0xff1E3D58),
                child: Icon(
                  FontAwesome5.filter,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          insetPadding: EdgeInsets.symmetric(horizontal: 10),
                          child: StatefulBuilder(
                            builder: (BuildContext context, setState) {
                              return Container(
                                width: 400,
                                height: 730,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _buildfilter(Octicons.home, 20, 'Type'),
                                    Wrap(
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Material(
                                              elevation: 5,
                                              child: InkWell(
                                                  child: Container(
                                                    color: _bungalowscolor,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 2),
                                                    child: Text('Bungalows',
                                                        style: GoogleFonts.dekko(
                                                            color:
                                                                _bungalowselected,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  onTap: () {
                                                    selected += 1;
                                                    setState(() {
                                                      if (selected == 1) {
                                                        _bungalowselected =
                                                            Colors.white;
                                                        _bungalowscolor =
                                                            Color(0xff073E74);

                                                        _villaselected =
                                                            Colors.black54;
                                                        _villacolor =
                                                            Colors.white;
                                                        villaselected = 0;

                                                        filter.type =
                                                            'bungalow';
                                                      }
                                                      if (selected == 2) {
                                                        _bungalowselected =
                                                            Colors.black54;
                                                        _bungalowscolor =
                                                            Colors.white;
                                                        selected = 0;
                                                      }
                                                    });
                                                  }),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Material(
                                              elevation: 5,
                                              child: InkWell(
                                                  child: Container(
                                                    color: _villacolor,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 2),
                                                    // width:100
                                                    child: Text('Villas',
                                                        style: GoogleFonts.dekko(
                                                            color:
                                                                _villaselected,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  onTap: () {
                                                    villaselected += 1;
                                                    setState(() {
                                                      if (villaselected == 1) {
                                                        _villaselected =
                                                            Colors.white;
                                                        _villacolor =
                                                            Color(0xff073E74);

                                                        _bungalowselected =
                                                            Colors.black54;
                                                        _bungalowscolor =
                                                            Colors.white;
                                                        selected = 0;

                                                        filter.type = 'villa';
                                                      }
                                                      if (villaselected == 2) {
                                                        _villaselected =
                                                            Colors.black54;
                                                        _villacolor =
                                                            Colors.white;
                                                        villaselected = 0;
                                                      }
                                                    });
                                                  }),
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          _buildfilter(
                                              Icons.king_bed, 25, 'bedrooms'),
                                          SizedBox(height: 10),
                                          Container(
                                            height: 40,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 5,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: GestureDetector(
                                                    child: Material(
                                                      elevation: 1,
                                                      child: Container(
                                                        color: selecteditem ==
                                                                list[index]
                                                            ? Color(0xff073E74)
                                                            : Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 5),
                                                        child: Text(
                                                            index == 0
                                                                ? 'Any'
                                                                : index == 4
                                                                    ? '4+'
                                                                    : index
                                                                        .toString(),
                                                            style: GoogleFonts
                                                                .dekko(
                                                                    // color: Colors.orange,
                                                                    color: selecteditem ==
                                                                            list[
                                                                                index]
                                                                        ? Colors
                                                                            .white
                                                                        : Color(
                                                                            0xff6E6E6E),
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        selecteditem = index;
index == 0?filter2.bathrooms = null:
                                                        index == 1
                                                            ? filter.bedrooms =
                                                                '1'
                                                            : index == 2
                                                                ? filter.bedrooms =
                                                                    '2'
                                                                : index == 3
                                                                    ? filter.bedrooms =
                                                                        '3'
                                                                    : filter.bedrooms =
                                                                        '4';
                                                      });
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          _buildfilter(FontAwesome5.bath, 20,
                                              'bathrooms'),
                                          Container(
                                            height: 40,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 5,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: GestureDetector(
                                                    child: Material(
                                                      elevation: 1,
                                                      child: Container(
                                                        color: selecteditem1 ==
                                                                list1[index]
                                                            ? Color(0xff073E74)
                                                            : Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 5),
                                                        child: Text(
                                                            index == 0
                                                                ? 'Any'
                                                                : index
                                                                    .toString(),
                                                            style: GoogleFonts
                                                                .dekko(
                                                                    // color: Colors.orange,
                                                                    color: selecteditem1 ==
                                                                            list1[
                                                                                index]
                                                                        ? Colors
                                                                            .white
                                                                        : Color(
                                                                            0xff6E6E6E),
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        selecteditem1 = index;
index == 0?filter2.bathrooms = null:
                                                        index == 1
                                                            ? filter.bathrooms =
                                                                '1'
                                                            : index == 2
                                                                ? filter.bathrooms =
                                                                    '2'
                                                                : index == 3
                                                                    ? filter.bathrooms =
                                                                        '3'
                                                                    : filter.bathrooms =
                                                                        '4';
                                                      });
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          _buildfilter(Elusive.tags, 20,
                                              'Price  ' + '/Tzs'),
                                          Container(
                                            width: 300,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('from',
                                                    style: GoogleFonts.dekko(
                                                        color: Colors.black,
                                                        // color: Color(0xff6E6E6E),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                Text(
                                                    selectedRange.start
                                                                .round()
                                                                .toString()
                                                                .length ==
                                                            6
                                                        ? selectedRange.start
                                                                .round()
                                                                .toString()
                                                                .substring(
                                                                    0, 3) +
                                                            ',' +
                                                            selectedRange.start
                                                                .round()
                                                                .toString()
                                                                .substring(3, 6)
                                                                .replaceRange(
                                                                    0, 3, '000')
                                                        : selectedRange.start
                                                                .round()
                                                                .toString()
                                                                .substring(
                                                                    0, 1) +
                                                            ',' +
                                                            selectedRange.start
                                                                .round()
                                                                .toString()
                                                                .substring(
                                                                    1, 4) +
                                                            ',' +
                                                            selectedRange.start
                                                                .round()
                                                                .toString()
                                                                .substring(4, 7)
                                                                .replaceRange(
                                                                    0, 3, '000'),
                                                    style: GoogleFonts.dekko(
                                                        //   color: Colors.orange,
                                                        color: Color(0xff423D04),
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold)),
                                                Text('to',
                                                    style: GoogleFonts.dekko(
                                                        color: Colors.black,
                                                        // color: Color(0xff6E6E6E),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                Text(
                                                    selectedRange.end
                                                                .round()
                                                                .toString()
                                                                .length ==
                                                            6
                                                        ? selectedRange.end
                                                                .round()
                                                                .toString()
                                                                .substring(
                                                                    0, 3) +
                                                            ',' +
                                                            selectedRange.end
                                                                .round()
                                                                .toString()
                                                                .substring(3, 6)
                                                                .replaceRange(
                                                                    0, 3, '000')
                                                        : selectedRange.end
                                                                .round()
                                                                .toString()
                                                                .substring(
                                                                    0, 1) +
                                                            ',' +
                                                            selectedRange.end
                                                                .round()
                                                                .toString()
                                                                .substring(
                                                                    1, 4) +
                                                            ',' +
                                                            selectedRange.end
                                                                .round()
                                                                .toString()
                                                                .substring(4, 7)
                                                                .replaceRange(
                                                                    0, 3, '000'),
                                                    style: GoogleFonts.dekko(
                                                        // color: Colors.orange,
                                                        color: Color(0xff423D04),
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold))
                                              ],
                                            ),
                                          ),
                                          RangeSlider(
                                            values: selectedRange,
                                            min: 200000,
                                            max: 10000000000,
                                            activeColor: Color(0xff10304F),
                                            inactiveColor: Color(0xffD3D3D3),
                                            onChanged: (RangeValues value) {
                                              setState(() {
                                                selectedRange = value;

                                                filter.startprice =
                                                    selectedRange.start
                                                        .toDouble();
                                                filter.endprice = selectedRange
                                                    .end
                                                    .toDouble();
                                              });
                                            },
                                          )
                                        ]),
                                    _buildfilter(Icons.sort, 20, 'Sort'),
                                    Wrap(
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Material(
                                              elevation: 5,
                                              child: InkWell(
                                                  child: Container(
                                                    color: _descendingcolor,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 2),
                                                    // width:100
                                                    child: Text('Descending',
                                                        style: GoogleFonts.dekko(
                                                            color:
                                                                _descendingselected,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  onTap: () {
                                                    descendingselected += 1;
                                                    setState(() {
                                                      if (descendingselected ==
                                                          1) {
                                                        _descendingselected =
                                                            Colors.white;
                                                        _descendingcolor =
                                                            Color(0xff073E74);

                                                        _ascendingselected =
                                                            Colors.black54;
                                                        _ascendingcolor =
                                                            Colors.white;
                                                        ascendingselected = 0;

                                                         filter.sortby =
                                                            'descending';
                                                      }
                                                      if (descendingselected ==
                                                          2) {
                                                        _descendingselected =
                                                            Colors.black54;
                                                        _descendingcolor =
                                                            Colors.white;
                                                        descendingselected = 0;
                                                      }
                                                    });
                                                  }),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Material(
                                              elevation: 5,
                                              child: InkWell(
                                                  child: Container(
                                                    color: _ascendingcolor,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 2),
                                                    // width:100
                                                    child: Text('Ascending',
                                                        style: GoogleFonts.dekko(
                                                            color:
                                                                _ascendingselected,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  onTap: () {
                                                    ascendingselected += 1;
                                                    setState(() {
                                                      if (ascendingselected ==
                                                          1) {
                                                        _ascendingselected =
                                                            Colors.white;
                                                        _ascendingcolor =
                                                            Color(0xff073E74);

                                                        _descendingselected =
                                                            Colors.black54;
                                                        _descendingcolor =
                                                            Colors.white;
                                                        descendingselected = 0;

                                                         filter.sortby =
                                                            'ascending';
                                                      }
                                                      if (ascendingselected ==
                                                          2) {
                                                        _ascendingselected =
                                                            Colors.black54;
                                                        _ascendingcolor =
                                                            Colors.white;
                                                        ascendingselected = 0;
                                                      }
                                                    });
                                                  }),
                                            ),
                                          ),
                                        ]),
                                    SizedBox(height: 15),
                                    _buildfilter(Elusive.th_large, 20, 'View'),
                                    Wrap(
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Material(
                                              elevation: 5,
                                              child: InkWell(
                                                  child: Container(
                                                    color: listviewcolor,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 2),
                                                    // width:100
                                                    child: Text('List view',
                                                        style: GoogleFonts.dekko(
                                                            color:
                                                                listviewselected,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  onTap: () {
                                                    listselected += 1;
                                                    setState(() {
                                                      if (listselected == 1) {
                                                        listviewselected =
                                                            Colors.white;
                                                        listviewcolor =
                                                            Color(0xff073E74);

                                                        mapcviewselcted =
                                                            Colors.black54;
                                                        mapviewcolor =
                                                            Colors.white;
                                                        mapselected = 0;
                                                      }
                                                      if (listselected == 2) {
                                                        listviewselected =
                                                            Colors.black54;
                                                        listviewcolor =
                                                            Colors.white;
                                                        listselected = 0;
                                                      }
                                                    });
                                                  }),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Material(
                                              elevation: 5,
                                              child: InkWell(
                                                  child: Container(
                                                    color: mapviewcolor,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 2),
                                                    // width:100
                                                    child: Text('Map view',
                                                        style: GoogleFonts.dekko(
                                                            color:
                                                                mapcviewselcted,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                  onTap: () {
                                                    mapselected += 1;
                                                    setState(() {
                                                      if (mapselected == 1) {
                                                        mapcviewselcted =
                                                            Colors.white;
                                                        mapviewcolor =
                                                            Color(0xff073E74);

                                                        listviewselected =
                                                            Colors.black54;
                                                        listviewcolor =
                                                            Colors.white;
                                                        listselected = 0;
                                                      }
                                                      if (mapselected == 2) {
                                                        mapcviewselcted =
                                                            Colors.black54;
                                                        mapviewcolor =
                                                            Colors.white;
                                                        mapselected = 0;
                                                      }
                                                    });
                                                  }),
                                            ),
                                          ),
                                        ]),
                                    Container(
                                      padding: EdgeInsets.only(top: 20),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                              child: Card(
                                                  color: Color(0xff273E47),
                                                  shape: CircleBorder(),
                                                  elevation: 5,
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Icon(
                                                          WebSymbols.left_open,
                                                          size: 15,
                                                          color:
                                                              Colors.white))),
                                              onTap: () {
                                                Navigator.pop(context);
                                              }),
                                          GestureDetector(
                                            child: Card(
                                                color: Color(0xffDEE2EC),
                                                shape: CircleBorder(),
                                                elevation: 5,
                                                child: Container(
                                                    padding: EdgeInsets.all(15),
                                                    child: Icon(
                                                        WebSymbols.arrows_cw,
                                                        size: 20))),
                                            onTap: () => setState(() {
                                              _bungalowselected =
                                                  Colors.black54;
                                              _bungalowscolor = Colors.white;
                                              _villaselected = Colors.black54;
                                              _villacolor = Colors.white;
                                              _descendingselected =
                                                  Colors.black54;
                                              _descendingcolor = Colors.white;
                                              _ascendingselected =
                                                  Colors.black54;
                                              _ascendingcolor = Colors.white;
                                              listviewselected = Colors.black54;
                                              listviewcolor = Colors.white;
                                              mapcviewselcted = Colors.black54;
                                              mapviewcolor = Colors.white;
                                              mapselected = 0;
                                              listselected = 0;
                                              selected = 0;
                                              villaselected = 0;
                                              ascendingselected = 0;
                                              descendingselected = 0;
                                              selectedRange =
                                                  RangeValues(200000, 3000000);
                                              selecteditem = 8;
                                              selecteditem1 = 8;
                                            }),
                                          ),
                                          GestureDetector(
                                              child: Card(
                                                  color: Color(0xff273E47),
                                                  shape: CircleBorder(),
                                                  elevation: 5,
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Icon(WebSymbols.ok,
                                                          size: 15,
                                                          color:
                                                              Colors.white))),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DummyPageWithLocation(
                                                                filteredcollectionforlocation(
                                                                    filter,
                                                                    widget
                                                                        .collection),
                                                                widget
                                                                    .transaction)));
                                                showSnackBar();
                                              })
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      });
                },
              ),
            ])));
  }
}
