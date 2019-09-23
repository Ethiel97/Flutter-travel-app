import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workshop_test/placeWidget.dart';
import 'locationWidget.dart';
import 'places.dart';

void main() => runApp(TravelAppWrapper());

class TravelAppWrapper extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Travel',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
      home: TravelApp(title: 'Mon application'),
    );
  }
}

class TravelApp extends StatefulWidget {
  TravelApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
  }

  itemClicked() {
    final SnackBar snackbar = SnackBar(
      content: Text('Bottom navigation bar item tapped'),
      backgroundColor: Colors.black,
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: buildBottomNavigationBar(context),
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(28),
        children: <Widget>[
          buildText(),
          SizedBox(
            height: 34,
          ),
          buildSearchBox(),
          SizedBox(
            height: 28.0,
          ),
          buildLocationsList(),
          buildPlacesList(context)
        ],
      ),
    );
  }

  Container buildPlacesList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 14),
          itemCount: places.length,
          itemBuilder: (context, index) {
            Place place = places.toList()[index];

            return new PlaceWidget(place: place);
          }),
    );
  }

  Container buildLocationsList() {
    return Container(
      height: 250,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: (context, index) {
            Place location = places.reversed.toList()[index];

            return new LocationWidget(location: location);
          }),
    );
  }

  Widget buildSearchBox() {
    TextEditingController controller = TextEditingController(text: '');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        onTap: () {
          final SnackBar snackbar = SnackBar(
            content: Text('Writing in the search box'),
            backgroundColor: Colors.black,
          );

          scaffoldKey.currentState.showSnackBar(snackbar);
        },
        key: Key('Search box'),
        controller: controller,
        decoration: InputDecoration(
            hintText: 'Eg, New York, United States',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: Icon(Icons.location_on)),
      ),
    );
  }

  Widget buildText() {
    return Text(
      'Where are you \ngoing?',
      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          final SnackBar snackbar = SnackBar(
            content: Text('Hamburger menu tapped'),
            backgroundColor: Colors.black,
          );

          scaffoldKey.currentState.showSnackBar(snackbar);
        },
        icon: Icon(
          Icons.menu,
          color: Colors.black54,
        ),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              final SnackBar snackbar = SnackBar(
                content: Text('Bell button tapped'),
                backgroundColor: Colors.black,
              );

              scaffoldKey.currentState.showSnackBar(snackbar);
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.black54,
            )),
      ],
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return Material(
      color: Colors.grey.shade50,
      elevation: 4.0,
      child: Container(
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        height: 54,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () => itemClicked(),
            ),
            IconButton(
              onPressed: () => itemClicked(),
              icon: Icon(
                Icons.favorite,
                color: Colors.blueGrey,
              ),
            ),
            IconButton(
              onPressed: () => itemClicked(),
              icon: Icon(
                Icons.message,
                color: Colors.blueGrey,
              ),
            ),
            IconButton(
              onPressed: () => itemClicked(),
              icon: Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
