import 'package:cng_admin/screens/dashboard.dart';
import 'package:cng_admin/screens/filling_staion.dart';
import 'package:cng_admin/screens/users.dart';
import 'package:cng_admin/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7EEE7),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 250,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  'CNGify',
                  style: TextStyle(fontSize: 25, color: Color(0xFF00A36C)),
                ),
                SizedBox(height: 80.0),
                CustomButton(
                  inverse: _tabController.index == 0,
                  iconData: Icons.dashboard,
                  label: 'Dashboard',
                  onTap: () {
                    _tabController.animateTo(0);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 1,
                  iconData: Icons.local_gas_station,
                  label: 'Filling Station',
                  onTap: () {
                    _tabController.animateTo(1);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 2,
                  iconData: Icons.supervised_user_circle_sharp,
                  label: 'Users',
                  onTap: () {
                    _tabController.animateTo(2);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 3,
                  iconData: Icons.money,
                  label: 'Revenue',
                  onTap: () {
                    _tabController.animateTo(3);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 4,
                  iconData: Icons.report,
                  label: 'Report',
                  onTap: () {
                    _tabController.animateTo(4);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 5,
                  iconData: Icons.feedback,
                  label: 'Feedback',
                  onTap: () {
                    _tabController.animateTo(5);
                    setState(() {});
                  },
                ),
                Spacer(),
                CustomButton(
                  inverse: false,
                  onTap: () {},
                  iconData: Icons.logout,
                  label: "Log out",
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Dashboard(),
                FillingStaion(),
                Users(),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.orange,
                ),
                Container(
                  color: Colors.brown,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
