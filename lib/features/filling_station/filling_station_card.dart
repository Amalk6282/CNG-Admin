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
