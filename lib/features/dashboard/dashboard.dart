import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Dashboard',
            style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              CustomCard(
                name: 'Filling Station',
                count: '40',
                icon: Icons.local_gas_station,
              ),
              SizedBox(
                width: 50,
              ),
              CustomCard(
                  name: 'Users',
                  count: '4330',
                  icon: Icons.supervised_user_circle_sharp),
              SizedBox(
                width: 50,
              ),
              CustomCard(
                  name: 'Current Reports',
                  count: '2',
                  icon: Icons.report_sharp),
              SizedBox(
                width: 50,
              ),
              CustomCard(name: 'Feedbacks', count: '250', icon: Icons.feedback),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            foregroundDecoration:
                BoxDecoration(border: Border.all(color: Color(0xFF00A36C))),
            height: 320,
            width: 1075,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String name, count;
  final IconData icon;
  const CustomCard({
    super.key,
    required this.name,
    required this.count,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 230,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Icon(
            icon,
            size: 60,
          ),
          Text(name, style: TextStyle(fontSize: 15)),
          Text(
            count,
            style: TextStyle(fontSize: 50),
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
