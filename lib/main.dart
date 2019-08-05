import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DetailScreen.dart';
import 'places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Travel',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
      home: MyHomePage(title: 'Mon application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Map place = places.toList()[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        "${place["img"]}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${place["name"]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 15,
                            color: Colors.blueGrey,
                          ),
                          Text(
                            "${place["location"]}",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text("${place["price"]}"),
                    ],
                  )
                ],
              ),
            );
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
            Map place = places.reversed.toList()[index];

            return Padding(
              padding: EdgeInsets.only(right: 14),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            place: place,
                          )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        height: 178,
                        width: 180,
                        child: Image.asset(
                          "${place["img"]}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "${place["name"]}",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${place["location"]}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Container buildSearchBox() {
    
  TextEditingController controller =
      TextEditingController(text: "Eg, New York, United States");

    return Container(
      
      decoration: BoxDecoration(
//              border: I,
        color: Colors.white70,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
//                  fillColor: Colors.white10,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: Icon(Icons.location_on)),
      ),
    );
  }

  Text buildText() {
    return Text(
      "Where are you \ngoing?",
      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.black54,
        ),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.black54,
            )),
      ],
    );
  }

  Material buildBottomNavigationBar(BuildContext context) {
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
              onPressed: () {},
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.blueGrey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color: Colors.blueGrey,
              ),
            ),
            IconButton(
              onPressed: () {},
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
