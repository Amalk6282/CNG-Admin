import 'package:cng_admin/common_widget/change_password.dart';
import 'package:cng_admin/features/feedback/feedbackpage.dart';
import 'package:cng_admin/features/login/login_page.dart';
import 'package:cng_admin/features/dashboard/dashboard.dart';
import 'package:cng_admin/features/filling_station/filling_staion.dart';
import 'package:cng_admin/features/report/reports_page.dart';
import 'package:cng_admin/features/users/users.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../common_widget/custom_alert_dialog.dart';

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
    _tabController = TabController(length: 6, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 250,
            color: Colors.white,
            child: Column(
              children: [
                Flexible(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 60.0,
                      ),
                      Text(
                        'CNGify',
                        style:
                            TextStyle(fontSize: 25, color: Color(0xFF00A36C)),
                      ),
                      SizedBox(height: 80.0),
                      DrawerItemButton(
                        inverse: _tabController.index == 0,
                        iconData: Icons.dashboard,
                        label: 'Dashboard',
                        onTap: () {
                          _tabController.animateTo(0);
                          setState(() {});
                        },
                      ),
                      DrawerItemButton(
                        inverse: _tabController.index == 1,
                        iconData: Icons.local_gas_station,
                        label: 'Filling Station',
                        onTap: () {
                          _tabController.animateTo(1);
                          setState(() {});
                        },
                      ),
                      DrawerItemButton(
                        inverse: _tabController.index == 2,
                        iconData: Icons.supervised_user_circle_sharp,
                        label: 'Users',
                        onTap: () {
                          _tabController.animateTo(2);
                          setState(() {});
                        },
                      ),
                      DrawerItemButton(
                        inverse: _tabController.index == 3,
                        iconData: Icons.money,
                        label: 'Revenue',
                        onTap: () {
                          _tabController.animateTo(3);
                          setState(() {});
                        },
                      ),
                      DrawerItemButton(
                        inverse: _tabController.index == 4,
                        iconData: Icons.report,
                        label: 'Report',
                        onTap: () {
                          _tabController.animateTo(4);
                          setState(() {});
                        },
                      ),
                      DrawerItemButton(
                        inverse: _tabController.index == 5,
                        iconData: Icons.feedback,
                        label: 'Feedback',
                        onTap: () {
                          _tabController.animateTo(5);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                DrawerItemButton(
                  inverse: false,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (comtext) => ChangePasswordDialog());
                  },
                  iconData: Icons.lock_outline_rounded,
                  label: "Change Password",
                ),
                DrawerItemButton(
                  inverse: false,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: "LOG OUT",
                        content: const Text(
                          "Are you sure you want to log out? Clicking 'Logout' will end your current session and require you to sign in again to access your account.",
                        ),
                        width: 400,
                        primaryButton: "LOG OUT",
                        onPrimaryPressed: () {
                          Supabase.instance.client.auth.signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (route) => false);
                        },
                      ),
                    );
                  },
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
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                ModernDashboard(),
                FillingStaion(),
                Users(),
                Container(
                  color: Colors.yellow,
                ),
                ReportsScreen(),
                Feedbackpage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItemButton extends StatelessWidget {
  final Function() onTap;
  final bool inverse;
  final IconData iconData;
  final String label;
  const DrawerItemButton({
    super.key,
    required this.onTap,
    this.inverse = true,
    required this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: inverse ? Color(0xFFE7EEE7) : Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Icon(
                iconData,
                color: inverse ? Color(0xFF00A36C) : Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: TextStyle(
                    color: inverse ? Color(0xFF00A36C) : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
