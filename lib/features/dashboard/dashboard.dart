import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ModernDashboard extends StatelessWidget {
  const ModernDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0C9D80),
              ),
            ),
            const SizedBox(height: 24),

            // Stats Cards
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              children: [
                FutureBuilder(
                    future: Supabase.instance.client
                        .from('filling_stations')
                        .select()
                        .count(),
                    builder: (context, snap) {
                      int count = snap.data?.count ?? 0;
                      return _buildStatCard(
                        'Filling Stations',
                        '$count',
                        Icons.local_gas_station,
                      );
                    }),
                FutureBuilder(
                    future: Supabase.instance.client
                        .from('customer_details')
                        .select()
                        .count(),
                    builder: (context, snap) {
                      int count = snap.data?.count ?? 0;
                      return _buildStatCard(
                        'Total Users',
                        '$count',
                        Icons.person,
                      );
                    }),
                _buildStatCard(
                  'Current Reports',
                  '0',
                  Icons.description,
                ),
                _buildStatCard(
                  'Feedbacks',
                  '0',
                  Icons.feedback,
                ),
              ],
            ),

            // const SizedBox(height: 32),

            // // Revenue Chart Section
            // Container(
            //   padding: const EdgeInsets.all(24),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(16),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.04),
            //         blurRadius: 12,
            //         spreadRadius: 0,
            //         offset: const Offset(0, 4),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         'Revenue',
            //         style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600,
            //           color: Color(0xFF0C9D80),
            //         ),
            //       ),
            //       const SizedBox(height: 24),
            // SizedBox(
            //   height: 300,
            //   child: BarChart(
            //     BarChartData(
            //       barGroups: _getBarGroups(),
            //       borderData: FlBorderData(show: false),
            //       gridData: const FlGridData(show: false),
            //       titlesData: FlTitlesData(
            //         leftTitles: const AxisTitles(
            //           sideTitles: SideTitles(showTitles: false),
            //         ),
            //         rightTitles: const AxisTitles(
            //           sideTitles: SideTitles(showTitles: false),
            //         ),
            //         topTitles: const AxisTitles(
            //           sideTitles: SideTitles(showTitles: false),
            //         ),
            //         bottomTitles: AxisTitles(
            //           sideTitles: SideTitles(
            //             showTitles: true,
            //             getTitlesWidget: (value, meta) {
            //               return Text(
            //                 'M${value.toInt() + 1}',
            //                 style: const TextStyle(
            //                   color: Colors.grey,
            //                   fontSize: 12,
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //       ],
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF0C9D80),
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0C9D80),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Manage',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  // List<BarChartGroupData> _getBarGroups() {
  //   final data = [60, 40, 55, 45, 60, 80, 70, 65, 50, 90];

  //   return data.asMap().entries.map((entry) {
  //     return BarChartGroupData(
  //       x: entry.key,
  //       barRods: [
  //         BarChartRodData(
  //           toY: entry.value.toDouble(),
  //           color: const Color(0xFF0C9D80),
  //           width: 16,
  //           borderRadius: const BorderRadius.vertical(
  //             top: Radius.circular(4),
  //           ),
  //         ),
  //       ],
  //     );
  //   }).toList();
  // }
}
