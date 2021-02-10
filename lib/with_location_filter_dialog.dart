import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';


class Details extends StatefulWidget {
  List pictures,bathroomlist,bedroomlist;
  String bedrooms, bathrooms;
  Details(this.pictures, this.bathrooms, this.bedrooms,this.bedroomlist,this.bathroomlist);

  @override
  _DetailsState createState() => _DetailsState();
}

int selected = 0;
Color containercolor, imagecolor;
//List<int> list = [0, 1, 2, 3, 4, 5, 6];
List<int> list6 = [0, 1, 2, 3, 4, 5, 6];
List<int> list5 =[0,1,2,3,4,5];List<int> list4 =[0,1,2,3,4];List<int> list3 =[0,1,2,3],list1=[0,1];
List<String> imagelist = [
  'https://i.pinimg.com/564x/6e/6d/26/6e6d269a71d2d480bec4a6033f7942e5.jpg',
  'https://i.pinimg.com/564x/64/94/c3/6494c33ca6af249c85cd23ce9fc4f044.jpg',
  'https://i.pinimg.com/564x/68/75/fc/6875fc346f3e2c5d9a3459432c37bd73.jpg'
];

List<String> imagelist1 = [
  'https://i.pinimg.com/564x/7b/b4/dd/7bb4dd40424fa1569480bf941c376bcc.jpg',
  'https://i.pinimg.com/564x/f4/b3/99/f4b3998306fa8372401bf738de37d4f1.jpg',
  'https://i.pinimg.com/564x/cc/d4/3d/ccd43d3a20e17b366a274e25ed49c01a.jpg'
];

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    // print(widget.bathrooms);
    //  print(widget.bedrooms);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            
            children: [


              widget.pictures.length == 7
                  ? widget.bedrooms == '1'
                      ? widget.bathrooms == '1'
                          ? SizedBox(
                              height: 700,
                              child: Container(
                                child: Image.network(
                                  selected == list6[0]
                                      ? widget.pictures[0]
                                      : selected == list6[1]
                                          ? widget.pictures[1]
                                          : selected == list6[2]
                                              ? widget.pictures[2]
                                              : selected == list6[3]
                                                  ? widget.pictures[3]
                                                  : selected == list6[4]
                                                      ? widget.pictures[4]
                                                      : selected == list6[5]
                                                          ? widget.pictures[5]
                                                          : widget.pictures[6],
                                  width: 411,
                                  height: 620,
                                  fit: BoxFit.fill,
                                ),
                              ))
                          : Container()
                      : widget.bathrooms == '1'
                          ? SizedBox(
                              height: 700,
                              child: selected == list6[0]
                                  ? Image.network(widget.pictures[0],
                                      width: 411, height: 620, fit: BoxFit.fill)
                                  : selected == list6[1]
                                      ? Image.network(widget.pictures[1],
                                          width: 411,
                                          height: 620,
                                          fit: BoxFit.fill)
                                      : selected == list6[2]
                                          ? Image.network(widget.pictures[2],
                                              width: 411,
                                              height: 620,
                                              fit: BoxFit.fill)
                                          : selected == list6[3]
                                              ? Image.network(
                                                  widget.pictures[3],
                                                  width: 411,
                                                  height: 620,
                                                  fit: BoxFit.fill)
                                              : selected == list6[4]
                                                  ? Image.network(
                                                      widget.pictures[4],
                                                      width: 411,
                                                      height: 620,
                                                      fit: BoxFit.fill)
                                                  : selected == list6[5]
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bedroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bedroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        )
                                                      : Image.network(
                                                          widget.pictures[6],
                                                          width: 411,
                                                          height: 620,
                                                          fit: BoxFit.fill))
                          : SizedBox(
                              height: 700,
                              child: selected == list6[0]
                                  ? Image.network(widget.pictures[0],
                                      width: 411, height: 620, fit: BoxFit.fill)
                                  : selected == list6[1]
                                      ? Image.network(widget.pictures[1],
                                          width: 411,
                                          height: 620,
                                          fit: BoxFit.fill)
                                      : selected == list6[2]
                                          ? Image.network(widget.pictures[2],
                                              width: 411,
                                              height: 620,
                                              fit: BoxFit.fill)
                                          : selected == list6[3]
                                              ? Image.network(
                                                  widget.pictures[3],
                                                  width: 411,
                                                  height: 620,
                                                  fit: BoxFit.fill)
                                              : selected == list6[4]
                                                  ? Image.network(
                                                      widget.pictures[4],
                                                      width: 411,
                                                      height: 620,
                                                      fit: BoxFit.fill)
                                                  : selected == list6[5]
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bedroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                 widget.bedroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        )
                                                      : ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bathroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bathroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        ))
                  : widget.pictures.length == 6
                      ? widget.bedrooms == '1'
                          ? widget.bathrooms == '1'
                              ? SizedBox(
                                  height: 700,
                                  child: Container(
                                    child: Image.network(
                                      selected == list5[0]
                                          ? widget.pictures[0]
                                          : selected == list5[1]
                                              ? widget.pictures[1]
                                              : selected == list5[2]
                                                  ? widget.pictures[2]
                                                  : selected == list5[3]
                                                      ? widget.pictures[3]
                                                      : selected == list5[4]
                                                          ? widget.pictures[4]
                                                          : widget.pictures[5],
                                      width: 411,
                                      height: 620,
                                      fit: BoxFit.fill,
                                    ),
                                  ))
                              : Container()
                          : widget.bathrooms == '1'
                              ? SizedBox(
                                  height: 700,
                                  child: selected == list5[0]
                                      ? Image.network(widget.pictures[0], width: 411, height: 620, fit: BoxFit.fill)
                                      : selected == list5[1]
                                          ? Image.network(widget.pictures[1], width: 411, height: 620, fit: BoxFit.fill)
                                          : selected == list5[2]
                                              ? Image.network(widget.pictures[2], width: 411, height: 620, fit: BoxFit.fill)
                                              : selected == list5[3]
                                                  ? Image.network(widget.pictures[3], width: 411, height: 620, fit: BoxFit.fill)
                                                  : selected == list5[4]
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bedroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bedroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        )
                                                      : Image.network(widget.pictures[5], width: 411, height: 620, fit: BoxFit.fill))
                              : SizedBox(
                                  height: 700,
                                  child: selected == list5[0]
                                      ? Image.network(widget.pictures[0], width: 411, height: 620, fit: BoxFit.fill)
                                      : selected == list5[1]
                                          ? Image.network(widget.pictures[1], width: 411, height: 620, fit: BoxFit.fill)
                                          : selected == list5[2]
                                              ? Image.network(widget.pictures[2], width: 411, height: 620, fit: BoxFit.fill)
                                              : selected == list5[3]
                                                  ? Image.network(widget.pictures[3], width: 411, height: 620, fit: BoxFit.fill)
                                                  : selected == list5[4]
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bedroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bedroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        )
                                                      : ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bathroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bathroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        ))
                      : widget.pictures.length == 5
                          ? widget.bedrooms == '1'
                              ? widget.bathrooms == '1'
                                  ? SizedBox(
                                      height: 700,
                                      child: Container(
                                        child: Image.network(
                                          selected == list4[0]
                                              ? widget.pictures[0]
                                              : selected == list4[1]
                                                  ? widget.pictures[1]
                                                  : selected == list4[2]
                                                      ? widget.pictures[2]
                                                      : selected == list4[3]
                                                          ? widget.pictures[3]
                                                          : widget.pictures[4],
                                          width: 411,
                                          height: 620,
                                          fit: BoxFit.fill,
                                        ),
                                      ))
                                  : Container()
                              : widget.bathrooms == '1'
                                  ? SizedBox(
                                      height: 700,
                                      child: selected == list4[0]
                                          ? Image.network(widget.pictures[0], width: 411, height: 620, fit: BoxFit.fill)
                                          : selected == list4[1]
                                              ? Image.network(widget.pictures[1], width: 411, height: 620, fit: BoxFit.fill)
                                              : selected == list4[2]
                                                  ? Image.network(widget.pictures[2], width: 411, height: 620, fit: BoxFit.fill)
                                                  : selected == list4[3]
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bedroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bedroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        )
                                                      : Image.network(widget.pictures[4], width: 411, height: 620, fit: BoxFit.fill))
                                  : SizedBox(
                                      height: 700,
                                      child: selected == list4[0]
                                          ? Image.network(widget.pictures[0], width: 411, height: 620, fit: BoxFit.fill)
                                          : selected == list4[1]
                                              ? Image.network(widget.pictures[1], width: 411, height: 620, fit: BoxFit.fill)
                                              : selected == list4[2]
                                                  ? Image.network(widget.pictures[2], width: 411, height: 620, fit: BoxFit.fill)
                                                  : selected == list4[3]
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bedroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bedroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        )
                                                      : ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bathroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bathroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        ))
                          : widget.pictures.length == 4
                              ? widget.bedrooms == '1'
                                  ? widget.bathrooms == '1'
                                      ? SizedBox(
                                          height: 700,
                                          child: Container(
                                            child: Image.network(
                                              selected == list3[0]
                                                  ? widget.pictures[0]
                                                  : selected == list3[1]
                                                      ? widget.pictures[1]
                                                      : selected == list3[2]
                                                          ? widget.pictures[2]
                                                          : widget.pictures[3],
                                              width: 411,
                                              height: 620,
                                              fit: BoxFit.fill,
                                            ),
                                          ))
                                      : Container()
                                  : widget.bathrooms == '1'
                                      ? SizedBox(
                                          height: 700,
                                          child: selected == list3[0]
                                              ? Image.network(widget.pictures[0], width: 411, height: 620, fit: BoxFit.fill)
                                              : selected == list3[1]
                                                  ? Image.network(widget.pictures[1], width: 411, height: 620, fit: BoxFit.fill)
                                                  : selected == list3[2]
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bedroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bedroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        )
                                                      : Image.network(widget.pictures[3], width: 411, height: 620, fit: BoxFit.fill))
                                      : SizedBox(
                                          height: 700,
                                          child: selected == list3[0]
                                              ? Image.network(widget.pictures[0], width: 411, height: 620, fit: BoxFit.fill)
                                              : selected == list3[1]
                                                  ? Image.network(widget.pictures[1], width: 411, height: 620, fit: BoxFit.fill)
                                                  : selected == list3[2]
                                                      ? ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bedroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bedroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        )
                                                      : ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              AlwaysScrollableScrollPhysics(),
                                                          itemCount: widget.bathroomlist.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image.network(
                                                                  widget.bathroomlist[
                                                                      index],
                                                                  width: 411,
                                                                  height: 620,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            );
                                                          },
                                                        ))
                              : selected==list1[0]? Panorama(
                                  child:
                                 
                                   Image.network(
                                     widget.pictures[0])
                                ):Image.network(widget.pictures[1],width:411,height:700,fit:BoxFit.fill),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.pictures.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Card(
                              shape: CircleBorder(),
                              elevation: 3,
                              child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: selected == index
                                          ? Color(0xff9C801C)
                                          : Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: widget.pictures.length == 7
                                      ? Center(
                                          child: index == 0
                                              ? Image.network(
                                                  'https://img.icons8.com/material-outlined/24/000000/sofa.png',
                                                  color: selected == list6[0]
                                                      ? Colors.white
                                                      : Colors.black54)
                                              : index == 1
                                                  ? Image.network(
                                                      'https://img.icons8.com/android/24/000000/cooker.png',
                                                      color: selected == list6[1]
                                                          ? Colors.white
                                                          : Colors.black54)
                                                  : index == 2
                                                      ? Image.network(
                                                          'https://img.icons8.com/windows/32/000000/dining-room.png',
                                                          color: selected ==
                                                                  list6[2]
                                                              ? Colors.white
                                                              : Colors.black54)
                                                      : index == 3
                                                          ? Image.network(
                                                              'https://img.icons8.com/ios-glyphs/30/000000/treadmill.png',
                                                              color: selected ==
                                                                      list6[3]
                                                                  ? Colors.white
                                                                  : Colors.black54)
                                                          : index == 4
                                                              ? Image.network('https://img.icons8.com/ios-glyphs/30/000000/tv-show.png', color: selected == list6[4] ? Colors.white : Colors.black54)
                                                              : index == 5
                                                                  ? Image.network('https://img.icons8.com/windows/32/000000/bed.png', color: selected == list6[5] ? Colors.white : Colors.black54)
                                                                  : Image.network('https://img.icons8.com/ios-glyphs/30/000000/shower.png', color: selected == list6[6] ? Colors.white : Colors.black54))
                                      : widget.pictures.length == 6
                                          ? Center(
                                              child: index == 0
                                                  ? Image.network('https://img.icons8.com/material-outlined/24/000000/sofa.png', color: selected == list5[0] ? Colors.white : Colors.black54)
                                                  : index == 1
                                                      ? Image.network('https://img.icons8.com/android/24/000000/cooker.png', color: selected == list5[1] ? Colors.white : Colors.black54)
                                                      : index == 2
                                                          ? Image.network('https://img.icons8.com/windows/32/000000/dining-room.png', color: selected == list5[2] ? Colors.white : Colors.black54)
                                                          : index == 3
                                                              ? Image.network('https://img.icons8.com/ios-glyphs/30/000000/treadmill.png', color: selected == list5[3] ? Colors.white : Colors.black54)
                                                              : index == 4
                                                                  ? Image.network('https://img.icons8.com/windows/32/000000/bed.png', color: selected == list5[4] ? Colors.white : Colors.black54)
                                                                  : Image.network('https://img.icons8.com/ios-glyphs/30/000000/shower.png', color: selected == list5[5] ? Colors.white : Colors.black54))
                                          : widget.pictures.length == 5
                                              ? Center(
                                                  child: index == 0
                                                      ? Image.network('https://img.icons8.com/material-outlined/24/000000/sofa.png', color: selected == list4[0] ? Colors.white : Colors.black54)
                                                      : index == 1
                                                          ? Image.network('https://img.icons8.com/android/24/000000/cooker.png', color: selected == list4[1] ? Colors.white : Colors.black54)
                                                          : index == 2
                                                              ? Image.network('https://img.icons8.com/windows/32/000000/dining-room.png', color: selected == list4[2] ? Colors.white : Colors.black54)
                                                              : index == 3
                                                                  ? Image.network('https://img.icons8.com/windows/32/000000/bed.png', color: selected == list4[3] ? Colors.white : Colors.black54)
                                                                  : Image.network('https://img.icons8.com/ios-glyphs/30/000000/shower.png', color: selected == list4[4] ? Colors.white : Colors.black54))
                                              : widget.pictures.length == 4
                                                  ? Center(
                                                      child: index == 0
                                                          ? Image.network('https://img.icons8.com/material-outlined/24/000000/sofa.png', color: selected == list3[0] ? Colors.white : Colors.black54)
                                                          : index == 1
                                                              ? Image.network('https://img.icons8.com/android/24/000000/cooker.png', color: selected == list3[1] ? Colors.white : Colors.black54)
                                                              : index == 2
                                                                  ? Image.network('https://img.icons8.com/windows/32/000000/bed.png', color: selected == list3[2] ? Colors.white : Colors.black54)
                                                                  : Image.network('https://img.icons8.com/ios-glyphs/30/000000/shower.png', color: selected == list3[3] ? Colors.white : Colors.black54))
                                                  : Center(
                                                      
                                                      
                                                        child: index == 0
                                                          ? Image.network( 'https://img.icons8.com/fluent-systems-filled/24/000000/360-view.png', color: selected == list1[0] ? Colors.white : Colors.black54)
                                                          : 
                                                               Image.network('https://img.icons8.com/ios-glyphs/30/000000/shower.png', color: selected == list1[1] ? Colors.white : Colors.black54)
                                                      
                                                      
                                                      
                                                      
                                                     
                                                    )),
                            ),
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                            },
                          );
                        },
                      )),
                ),
              ),
            /*   Positioned(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Container(child: Icon(FontAwesome5.arrow_left)),
                  onTap: Navigator.of(context).pop,
                ),
              )),
              Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Container(
                            child: Icon(FontAwesome5.long_arrow_alt_right)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageViewer()),
                          );
                        }),
                  )) */
            ],
          ),
        ),
      ),
    );
  }
}
