import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const ReportsPage());
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNG Fuel Admin Panel',
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ReportsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Report {
  final String id;
  final String title;
  final String stationName;
  final DateTime date;
  final double totalSales;
  final int totalTransactions;

  Report({
    required this.id,
    required this.title,
    required this.stationName,
    required this.date,
    required this.totalSales,
    required this.totalTransactions,
  });
}

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Report> reports = [];
  List<Report> filteredReports = [];

  @override
  void initState() {
    super.initState();
    // Generate sample reports data
    _generateSampleReports();
    filteredReports = List.from(reports);
  }

  void _generateSampleReports() {
    reports = List.generate(
        10,
        (index) => Report(
              id: 'RPT${1000 + index}',
              title: 'Daily Report #${index + 1}',
              stationName: 'Freedom Fuel Filling Station',
              date: DateTime.now().subtract(Duration(days: index)),
              totalSales: 3500 + (index * 150.5),
              totalTransactions: 45 + index,
            ));
  }

  void _filterReports(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredReports = List.from(reports);
      } else {
        filteredReports = reports.where((report) {
          return report.title.toLowerCase().contains(query.toLowerCase()) ||
              report.stationName.toLowerCase().contains(query.toLowerCase()) ||
              report.id.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Text(
              'Reports',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00A36C),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search reports...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onChanged: _filterReports,
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Show filter dialog
                    _showFilterDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF00A36C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Color(0xFF00A36C)),
                    ),
                  ),
                  child: const Text('Filter'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: filteredReports.length,
              itemBuilder: (context, index) {
                final report = filteredReports[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.green.shade200, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '#${report.title}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _showReportDetails(context, report);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF00A36C),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: const Text('Details'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Text(
                              report.stationName,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            TextButton(
                              onPressed: () {
                                _showReportDetails(context, report);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Color(0xFF00A36C),
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(50, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text('View Details'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Generate new report functionality
          _showCreateReportDialog(context);
        },
        backgroundColor: Color(0xFF00A36C),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Reports'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Start Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context, isStartDate: true);
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'End Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context, isStartDate: false);
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Station',
                ),
                items: const [
                  DropdownMenuItem(value: 'all', child: Text('All Stations')),
                  DropdownMenuItem(
                      value: 'freedom',
                      child: Text('Freedom Fuel Filling Station')),
                ],
                onChanged: (value) {},
                value: 'all',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Apply filter logic here
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00A36C),
                foregroundColor: Colors.white,
              ),
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context,
      {required bool isStartDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      // Apply date selection logic
    }
  }

  void _showReportDetails(BuildContext context, Report report) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        report.title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Station Name'),
                    subtitle: Text(report.stationName),
                    leading: const Icon(Icons.local_gas_station,
                        color: Color(0xFF00A36C)),
                  ),
                  ListTile(
                    title: const Text('Date'),
                    subtitle:
                        Text(DateFormat('dd MMM yyyy').format(report.date)),
                    leading: const Icon(Icons.calendar_today,
                        color: Color(0xFF00A36C)),
                  ),
                  ListTile(
                    title: const Text('Total Sales'),
                    subtitle: Text('\$${report.totalSales.toStringAsFixed(2)}'),
                    leading: const Icon(Icons.attach_money,
                        color: Color(0xFF00A36C)),
                  ),
                  ListTile(
                    title: const Text('Total Transactions'),
                    subtitle: Text('${report.totalTransactions}'),
                    leading: const Icon(Icons.point_of_sale,
                        color: Color(0xFF00A36C)),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text(
                    'Transaction Breakdown',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 76,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Transaction #${1000 + index}'),
                          subtitle: Text(
                              '${DateFormat('HH:mm').format(report.date.add(Duration(hours: index)))} - Vehicle CNG-${1000 + index}'),
                          trailing: Text(
                              '\$${(75.0 + (index * 12.5)).toStringAsFixed(2)}'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Download report functionality
                        },
                        icon: const Icon(Icons.download),
                        label: const Text('Download'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00A36C),
                          foregroundColor: Colors.white,
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Share report functionality
                        },
                        icon: const Icon(Icons.share),
                        label: const Text('Share'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFF00A36C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void _showCreateReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Generate New Report'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Report Type',
                ),
                items: const [
                  DropdownMenuItem(value: 'daily', child: Text('Daily Report')),
                  DropdownMenuItem(
                      value: 'weekly', child: Text('Weekly Report')),
                  DropdownMenuItem(
                      value: 'monthly', child: Text('Monthly Report')),
                ],
                onChanged: (value) {},
                value: 'daily',
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Date Range',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () {
                  // Select date range
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Station',
                ),
                items: const [
                  DropdownMenuItem(value: 'all', child: Text('All Stations')),
                  DropdownMenuItem(
                      value: 'freedom',
                      child: Text('Freedom Fuel Filling Station')),
                ],
                onChanged: (value) {},
                value: 'freedom',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Generate report logic
                Navigator.pop(context);

                // Add the new report to the list
                setState(() {
                  final newReport = Report(
                    id: 'RPT${1000 + reports.length}',
                    title: 'Daily Report #${reports.length + 1}',
                    stationName: 'Freedom Fuel Filling Station',
                    date: DateTime.now(),
                    totalSales: 3700.50,
                    totalTransactions: 52,
                  );

                  reports.insert(0, newReport);
                  filteredReports = List.from(reports);
                });

                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Report generated successfully'),
                    backgroundColor: Color(0xFF00A36C),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00A36C),
                foregroundColor: Colors.white,
              ),
              child: const Text('Generate'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
