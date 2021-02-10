import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'atlocation.dart';
import 'filter.dart';
import 'housespage.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

String transaction, propertytype, thevalue;
Color buytextcolor = Colors.white,
    buybottoncolor = Colors.blue,
    renttextcolor = Colors.black,
    rentbuttoncolor = Colors.white;
var collection = FirebaseFirestore.instance.collection('all-properties');
Filter filter = Filter();
TextEditingController _textcontroller = TextEditingController();

class _ExploreScreenState extends State<ExploreScreen> {
  String image =
      'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/home-image.png?alt=media&token=df50644b-297e-4bc3-a957-957309d48fbd';
  String personimage =
      'https://i.pinimg.com/564x/ca/fb/b6/cafbb62a06614acccf5e95965f0aff82.jpg';

  Widget _buildcard(String image, String name, String number) {
    return Material(
      elevation: 10,
      shadowColor: Color(0xff646464),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 173,
        height: 184,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: NetworkImage(image),
              width: 85,
              height: 115,
              fit: BoxFit.fill,
            ),
            Text(
              name,
              style: TextStyle(
                  fontFamily: 'Balsamiq-Regular',
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              number,
              style: TextStyle(
                fontFamily: 'SkyText',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(String image, String title) {
    return Card(
      child: Stack(
        children: [
          Image.network(
            image,
            width: 339,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 150,
            child: Container(
              width: 339,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Balsamiq-Regular',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          color: Colors.white,
                          child: Text(
                            'MORE',
                            style: TextStyle(
                                fontFamily: 'SkyText',
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                fit: BoxFit.fill,
                image: NetworkImage(image),
                width: 411,
                height: 310,
              ),
              Positioned(
                left: 150,
                top: 55,
                child: Text(
                  'RealtorsCo',
                  style: TextStyle(
                    fontFamily: 'Hallandale',
                    fontSize: 22,
                  ),
                ),
              ),
            /*   Positioned(
                top: 20,
                right: 20,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(personimage),
                ),
              ), */
              Positioned(
                top: 100,
                left: 100,
                child: FlatButton(
                  color: buybottoncolor,
                  child: Text(
                    'BUY',
                    style: TextStyle(
                      color: buytextcolor,
                      fontFamily: 'SkyText',
                      fontSize: 22,
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      transaction = 'BUY';
                      buytextcolor = Colors.white;
                      buybottoncolor = Colors.blue;
                      renttextcolor = Colors.black;
                      rentbuttoncolor = Colors.white;
                    });
                    // addproperty();
                  },
                ),
              ),
              Positioned(
                top: 100,
                left: 250,
                child: FlatButton(
                  color: rentbuttoncolor,
                  child: Text(
                    'RENT',
                    style: TextStyle(
                      color: renttextcolor,
                      fontFamily: 'SkyText',
                      fontSize: 22,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      transaction = 'RENT';
                      renttextcolor = Colors.white;
                      rentbuttoncolor = Colors.blue;
                      buytextcolor = Colors.black;
                      buybottoncolor = Colors.white;
                    });
                  },
                ),
              ),
              Positioned(
                top:180,left:10,
                child: Text(
                  'Quick Search',
                  style: TextStyle(
                      fontFamily: 'Dekko', color: Colors.white, fontSize: 20),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: _textcontroller,
                      style: TextStyle(fontFamily: 'Dekko', fontSize: 20),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          fillColor: Color(0xffEFF3EF),
                          filled: true,
                          hintText: 'where do you wanna live',
                          hintStyle: TextStyle(
                            fontFamily: 'Dekko',
                            fontSize: 20,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AtLocation(thevalue),
                                )),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          )),
                      onSubmitted: (value) {
                        thevalue = _textcontroller.text.toLowerCase();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AtLocation(thevalue),
                            ));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    if (transaction == 'RENT') {
                      collection = FirebaseFirestore.instance
                          .collection('houses-for-rent');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HousesPage(collection, transaction),
                          ));
                    }
                    if (transaction == 'BUY') {
                      collection = FirebaseFirestore.instance
                          .collection('houses-for-sale');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HousesPage(collection, transaction),
                          ));
                    }
                  },
                  child: _buildcard(
                      'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/4344120.png?alt=media&token=a8e4548b-1d00-43ba-ae05-060bcaae66fa',
                      'Houses',
                      '345')),
              InkWell(
                onTap: () {
                  if (transaction == 'RENT') {
                    collection = FirebaseFirestore.instance
                        .collection('apartments-for-rent');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HousesPage(collection, transaction),
                        ));
                  }
                  if (transaction == 'BUY') {
                    filter.type = 'multibedroom';
                    collection = FirebaseFirestore.instance
                        .collection('apartments-for-sale');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HousesPage(collection, transaction),
                        ));
                  }
                },
                child: _buildcard(
                    'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/Asset%201.png?alt=media&token=f03dcf78-4e4c-49e6-951a-adc58ba1b99c',
                    'Apartments',
                    '546'),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                'FEATURED',
                style: TextStyle(
                  color: Color(0xff3E3A0C),
                  fontFamily: 'SkyText',
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Container(
            height: 220,
            padding: EdgeInsets.only(left: 10,top:10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  //    onTap: () => addproperty(),
                  child: _buildFeaturedCard(
                      'https://i.pinimg.com/564x/f8/49/56/f84956261007a67d6fda516cd49156ec.jpg',
                      'Minimalist Apartments'),
                ),
                _buildFeaturedCard(
                    'https://i.pinimg.com/564x/b5/88/12/b58812103f340820dd14f8faf98f1de2.jpg',
                    'Modest Villas'),
                _buildFeaturedCard(
                    'https://i.pinimg.com/564x/36/76/94/36769431c653c9081ab80c88845a2c86.jpg',
                    'Luxury Apartments'),
                _buildFeaturedCard(
                    'https://www.houseplans.net/uploads/plans/24654/elevations/53819-768.jpg',
                    'Modern Bungalows')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final database1 = FirebaseFirestore.instance;
addproperty1() async {
  await database.collection('apartments-for-rent').add({
    'price': '450,000',
    'image':
        'https://i.pinimg.com/564x/17/a8/68/17a86828e065977f2b5f7b8d1fba1747.jpg',
    'title': 'Single family simple home with unconditional lightning',
    'type': 'studio',
    'description':
        'Exquisite Brand New complete state of the Art luxury Renovation inside and outside, High Ceilings through out entire House, Extra large Master bedroom , Private driveway with detached garage.. Excellent location, near schools, trains, buses, shopping etc, Absolutely one of a kind in the area.',
    'size': '20,567',
    'district': 'Kigamboni',
    'street': 'VC Estates',
    'property-agent-name': 'Linda Brown',
    'property-agent':
        'https://i.pinimg.com/236x/d6/4e/a8/d64ea850464c7d931453c4336713aac4.jpg',
    'latitude': '-6.787548',
    'longitude': '39.222310',
    'bedrooms': '1',
    'bathrooms': '1',
    'kitchens': '1',
    'living-rooms': '1',
    'dining?': 'yes',
    'dining-rooms': '1',
    'bathroom-image':
        'https://i.pinimg.com/564x/86/56/dc/8656dc2b7b1cdca5ff09398e3f474fa6.jpg',
    'bathroom-image-2':
        'https://i.pinimg.com/564x/86/56/dc/8656dc2b7b1cdca5ff09398e3f474fa6.jpg',
    'bathroom-image-3':
        'https://i.pinimg.com/564x/dd/ba/05/ddba05e17127a1bba0f2271cd8e75b35.jpg',
    'bathroom-image-4':
        'https://i.pinimg.com/564x/dd/ba/05/ddba05e17127a1bba0f2271cd8e75b35.jpg',
    'bedroom-image':
        'https://i.pinimg.com/564x/f5/83/74/f58374a394893643f9a1dd486cd0ab4f.jpg',
    'bedroom-image-2':
        'https://i.pinimg.com/564x/68/56/dc/6856dcc68d10fcd26eda08de95bec7aa.jpg',
    'bedroom-image-3':
        'https://i.pinimg.com/564x/b5/ef/ab/b5efabfa4c4c6dbf2439f0546543f9ec.jpg',
    'bedroom-image-4':
        'https://i.pinimg.com/564x/5e/82/6d/5e826d24a2f2f8a3c107da5dd8e97b20.jpg',
    'kitchen-image':
        'https://i.pinimg.com/564x/cc/b9/6b/ccb96b8f47ac11f030a40f9a558843e3.jpg',
    'living-room-image':
        'https://i.pinimg.com/564x/27/a0/0a/27a00a84f3a406572b610366dab2b502.jpg',
    'dining-room-image':
        'https://i.pinimg.com/564x/2f/db/89/2fdb89cea7e02e3ee06b09ca9e4061c0.jpg',
    'gym?': 'no',
    'gym-image':
        'https://i.pinimg.com/564x/b4/a5/90/b4a59084a48a92df33f2f7052dc6adba.jpg',
    'home-theatre?': 'no',
    'home-theatre-image':
        'https://i.pinimg.com/564x/84/0c/38/840c3851faa949c63c02e7c72d7feffc.jpg',
    'pool?': 'no',
    'pool-image':
        'https://i.pinimg.com/564x/eb/fc/b5/ebfcb5a8a48ed4fdd953cc831323d1a0.jpg',
    'half-bathroom?': 'yes',
    'half-bathroom-image':
        'https://i.pinimg.com/564x/14/12/60/141260550680994fd2e2f413b19b3253.jpg'
  });
}

final database = FirebaseFirestore.instance;
addproperty() async {
  await database
      .collection('apartments-for-rent')
      .doc('p0nHGzQL19TdYYsSRXq4')
      .update({
    'other rooms': 'None',
    'photos': [
      'https://firebasestorage.googleapis.com/v0/b/real-estate-demo-v1.appspot.com/o/panorama6.jpeg?alt=media&token=09bca70c-62f0-4772-a4b4-b05c358e7890',
      'https://i.pinimg.com/564x/58/ac/49/58ac493d21cccdc59a026b00700f2b60.jpg'
    ],
    'bedroomslist': ['dummy'],
    'bathroomlist': ['dummy']
  });
}

/* 
4CJx7tLZvb6Ef2LBUltg         1
68iSWyjYOv3oNjFMfb6e         2
7T0ZsV7c0ll9OFvMp2v4         3
GXh8KR9zBSk3Sw6ZVaQN          4
GviZDE6RMwKifW0JDSLJ          5
I5tk3hH1KTFyKUId2W3h       6
JGovHhUCRtTAxb1gXT06          7
Y61SCUGHdhJw3Y1CRuFs          8
duRUYNT9QVrqO5jjsAsN          9
p0nHGzQL19TdYYsSRXq4         10
 */
