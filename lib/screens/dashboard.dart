import 'package:cng_admin/widgets/customcard.dart';
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
