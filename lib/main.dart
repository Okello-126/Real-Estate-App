import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:real_estate_demo/explore_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'featured screens/favourites.dart';

/* import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/zocial_icons.dart'; */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExplorePage(),
    );
  }
}

class ExplorePage extends StatefulWidget {
  ExplorePage({Key key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}



class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {

PersistentTabController _controller;
_controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
        return [
        ExploreScreen(),
       Favourites(),
        Container(),
        Container()
        ];
    }
  List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(Icons.explore),
                title: ("Explorer"),
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
            ),
            PersistentBottomNavBarItem(
               // icon: Icon(Icons.save),
               icon: Icon(CupertinoIcons.bookmark_fill),
                title: ("Saved"),
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
            ),
             PersistentBottomNavBarItem(
               icon: Icon(Icons.notifications),
          // icon: Icon(FontAwesome.bell_alt),
                title: ("Notifications"),
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
            ),
             PersistentBottomNavBarItem(
                icon: Icon(Icons.person),
                title: ("Profile"),
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
            ),
        ];
    }


    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }

 
}

/* child: FloatingActionButton(onPressed: () async {
        addproperty();
      }), 
  final database = FirebaseFirestore.instance;
  addproperty() async {
    await database.collection('houses-for-sale').add({
      'price': '7,530,000,000',
    'image': 'https://i.pinimg.com/564x/05/10/5e/05105e96165f1b9c67f1eb3fd2d8f708.jpg',
    'title': 'Single family simple home with unconditional lightning',
    'type': 'villa',
    'description': 'Exquisite Brand New complete state of the Art luxury Renovation inside and outside, High Ceilings through out entire House, Extra large Master bedroom , Private driveway with detached garage.. Excellent location, near schools, trains, buses, shopping etc, Absolutely one of a kind in the area.',
    'size': '44,567',
    'district': 'Temeke',
    'street': 'Chang\'ombe',
    'property-agent-name': 'Linda Brown',
    'property-agent': 'https://i.pinimg.com/236x/d6/4e/a8/d64ea850464c7d931453c4336713aac4.jpg',
    'latitude': '-6.787548',
    'longitude': '39.222310',
    'bedrooms': '4',
    'bathrooms': '3.5',
    'kitchens': '1',
    'living-rooms': '1',
    'dining?': 'yes',
    'dining-rooms':'1',
    'bathroom-image': 'https://i.pinimg.com/564x/14/12/60/141260550680994fd2e2f413b19b3253.jpg',
    'bathroom-image-2':'https://i.pinimg.com/564x/86/56/dc/8656dc2b7b1cdca5ff09398e3f474fa6.jpg',
      'bathroom-image-3':'https://i.pinimg.com/564x/dd/ba/05/ddba05e17127a1bba0f2271cd8e75b35.jpg',
       
    'bedroom-image': 'https://i.pinimg.com/564x/bb/6c/bf/bb6cbfd7e046aee1af91aae7d6dc4bbb.jpg',
    'bedroom-image-2':'https://i.pinimg.com/564x/e2/51/fd/e251fd7f4af5138988022c043ba670fc.jpg',
     'bedroom-image-3':'https://i.pinimg.com/564x/b5/ef/ab/b5efabfa4c4c6dbf2439f0546543f9ec.jpg',
      'bedroom-image-4':'https://i.pinimg.com/564x/5e/82/6d/5e826d24a2f2f8a3c107da5dd8e97b20.jpg',
    'kitchen-image': 'https://i.pinimg.com/564x/cc/b9/6b/ccb96b8f47ac11f030a40f9a558843e3.jpg',
    'living-room-image': 'https://i.pinimg.com/564x/27/a0/0a/27a00a84f3a406572b610366dab2b502.jpg',
    'dining-room-image': 'https://i.pinimg.com/564x/2f/db/89/2fdb89cea7e02e3ee06b09ca9e4061c0.jpg',
    'gym?': 'yes',
    'gym-image': 'https://i.pinimg.com/564x/b4/a5/90/b4a59084a48a92df33f2f7052dc6adba.jpg',
    'home-theatre?': 'yes',
    'home-theatre-image': 'https://i.pinimg.com/564x/84/0c/38/840c3851faa949c63c02e7c72d7feffc.jpg',
    'pool?': 'yes',
    'pool-image': 'https://i.pinimg.com/564x/eb/fc/b5/ebfcb5a8a48ed4fdd953cc831323d1a0.jpg',
    'half-bathroom?':'yes',
    'half-bathroom-image':'https://i.pinimg.com/564x/14/12/60/141260550680994fd2e2f413b19b3253.jpg' 
    });
  }*/
