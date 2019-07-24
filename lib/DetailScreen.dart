//st
import 'package:flutter/material.dart';
import 'package:async/async.dart';

import 'package:workshop_test/places.dart';

class DetailScreen extends StatelessWidget {
  final Map place;

  const DetailScreen({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.airplanemode_active),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
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
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: <Widget>[
          Container(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  Map place = places.toList()[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "${place["img"]}",
                        fit: BoxFit.cover,
                        width: 360,
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${place["name"]}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.bookmark),
            ],
          ),
          SizedBox(
            height: 24,
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
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            ],
          ),
          SizedBox(
            height: 22,
          ),
          Text(
            "${place["price"]}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "Details",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "${place["details"]}",
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 2,
            ),
          )
        ],
      ),
    );
  }
}
