import 'package:flutter/material.dart';
import 'package:workshop_test/places.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({
    Key key,
    @required this.location,
  }) : super(key: key);

  final Place location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              height: 178,
              width: 180,
              child: Image.asset(
                '${location.picture}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            '${location.name}',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '${location.location}',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
