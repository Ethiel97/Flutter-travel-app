import 'package:flutter/material.dart';
import 'package:workshop_test/place_widget.dart';
import 'package:workshop_test/places.dart';

import 'location_tile.dart';

class HomeScreen extends StatelessWidget {
  //  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(28),
      children: <Widget>[
        buildHeader(),
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
    );
  }

  Widget buildPlacesList(BuildContext context) {
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

  Widget buildLocationsList() {
    return Container(
      height: 250,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: (context, index) {
            Place location = places.reversed.toList()[index];

            return new LocationTile(location: location);
          }),
    );
  }

  Widget buildSearchBox() {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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

  Widget buildHeader() {
    return Text(
      'Where are you \ngoing?',
      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
    );
  }
}
