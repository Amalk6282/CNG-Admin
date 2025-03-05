import 'package:flutter/material.dart';

class FillingStationCard extends StatelessWidget {
  final String url, station;
  final Function() onManage, onEdit, onDelete;
  const FillingStationCard(
      {super.key,
      required this.url,
      required this.station,
      required this.onManage,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  station,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: onEdit,
                      child: Text(
                        'Edit',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: onDelete,
                      child: Text(
                        'Delete',
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                    ),
                    TextButton(
                        onPressed: onManage,
                        child: Text(
                          'Manage',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFF00A36C)),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showStationDetails(
    BuildContext context, Map<dynamic, dynamic> stationDetails) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(stationDetails['name']),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('ID: ${stationDetails['id']}'),
              Text('Created At: ${stationDetails['created_at']}'),
              Text('User ID: ${stationDetails['user_id']}'),
              Text('Phone: ${stationDetails['phone']}'),
              Image.network(stationDetails['image_url']),
              Text('State: ${stationDetails['state']}'),
              Text('District: ${stationDetails['district']}'),
              Text('Place: ${stationDetails['place']}'),
              Text('Pincode: ${stationDetails['pincode']}'),
              Text('Address: ${stationDetails['address_line']}'),
              Text('Email: ${stationDetails['email']}'),
              Text('Latitude: ${stationDetails['location_latitude']}'),
              Text('Longitude: ${stationDetails['location_longitude']}'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
