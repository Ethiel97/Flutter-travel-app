import 'package:flutter/material.dart';
import 'package:workshop_test/places.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
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
                "${place.picture}",
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
                '${place.name}',
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
                    '${place.location}',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text('${place.price}'),
            ],
          )
        ],
      ),
    );
  }
}
