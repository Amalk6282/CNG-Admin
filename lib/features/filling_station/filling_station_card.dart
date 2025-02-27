import 'package:flutter/material.dart';

class FillingStationCard extends StatelessWidget {
  final String url, station;
  const FillingStationCard(
      {super.key, required this.url, required this.station});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 286,
      color: Colors.white,
      child: Column(
        children: [
          Image(
            image: NetworkImage(
              url,
            ),
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            station,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Manage',
                style: TextStyle(fontSize: 15, color: Color(0xFF00A36C)),
              ))
        ],
      ),
    );
  }
}
