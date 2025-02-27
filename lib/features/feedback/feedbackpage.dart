import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Feedbackpage extends StatefulWidget {
  const Feedbackpage({Key? key}) : super(key: key);

  @override
  State<Feedbackpage> createState() => _FeedbackpageState();
}

class Feedback {
  final String id;
  final String title;
  final String customerName;
  final DateTime date;
  final String message;
  final int rating;
  final bool isResolved;

  Feedback({
    required this.id,
    required this.title,
    required this.customerName,
    required this.date,
    required this.message,
    required this.rating,
    required this.isResolved,
  });
}

class _FeedbackpageState extends State<Feedbackpage> {
  final List<Feedback> _feedbackList = [];
  List<Feedback> _filteredFeedbackList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateSampleFeedback();
    _filteredFeedbackList = List.from(_feedbackList);
  }

  void _generateSampleFeedback() {
    final List<String> titles = [
      'Service was excellent',
      'Long waiting time',
      'App crashed during payment',
      'Great experience overall',
      'Attendant was helpful',
      'App interface needs improvement',
      'Fast refueling service',
      'Payment issue',
    ];

    final List<String> customers = [
      'John Smith',
      'Emma Wilson',
      'Michael Brown',
      'Sarah Davis',
      'Robert Johnson',
      'Lisa Anderson',
      'David Miller',
      'Jennifer Garcia',
    ];

    final List<String> messages = [
      'The staff was very friendly and professional. Refueling was quick and efficient.',
      'Had to wait for more than 15 minutes to get my turn. Need to improve queue management.',
      'While trying to make payment through the app, it crashed multiple times. Had to restart my phone.',
      'From booking the slot to refueling, everything was smooth. Will definitely use again.',
      'The attendant helped me understand how to use the app for booking my next refueling slot.',
      'App is confusing to navigate. Buttons are not clearly labeled.',
      'In and out in less than 5 minutes. Very efficient service!',
      'My payment was deducted twice for a single refueling session. Please resolve immediately.',
    ];

    for (int i = 0; i < 8; i++) {
      _feedbackList.add(
        Feedback(
          id: 'FB${1000 + i}',
          title: titles[i],
          customerName: customers[i],
          date: DateTime.now().subtract(Duration(days: i * 2)),
          message: messages[i],
          rating: 5 - (i % 5),
          isResolved: i % 3 == 0,
        ),
      );
    }
  }

  void _filterFeedback(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredFeedbackList = List.from(_feedbackList);
      } else {
        _filteredFeedbackList = _feedbackList
            .where((feedback) =>
                feedback.title.toLowerCase().contains(query.toLowerCase()) ||
                feedback.customerName
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                feedback.message.toLowerCase().contains(query.toLowerCase()))
            .toList();
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
            padding: const EdgeInsets.only(left: 40, right: 40, top: 60),
            child: Text(
              'Feedback',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00A36C),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search feedback...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: _filterFeedback,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _filteredFeedbackList.length,
              itemBuilder: (context, index) {
                final feedback = _filteredFeedbackList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                      color: Color(0xFF00A36C).withOpacity(0.3),
                      width: 1.0,
                    ),
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
                              '#Title',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _showFeedbackDetails(context, feedback);
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
                        TextButton(
                          onPressed: () {
                            _showFeedbackDetails(context, feedback);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF00A36C),
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerLeft,
                          ),
                          child: const Text('View Details'),
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
          _showAddFeedbackDialog(context);
        },
        backgroundColor: Color(0xFF00A36C),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showFeedbackDetails(BuildContext context, Feedback feedback) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    feedback.title,
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
                title: const Text('Customer Name'),
                subtitle: Text(feedback.customerName),
                leading: const Icon(Icons.person, color: Color(0xFF00A36C)),
              ),
              ListTile(
                title: const Text('Date'),
                subtitle: Text(
                    DateFormat('dd MMM yyyy, hh:mm a').format(feedback.date)),
                leading:
                    const Icon(Icons.calendar_today, color: Color(0xFF00A36C)),
              ),
              ListTile(
                title: const Text('Rating'),
                subtitle: Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < feedback.rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 20,
                    ),
                  ),
                ),
                leading: const Icon(Icons.thumb_up, color: Color(0xFF00A36C)),
              ),
              ListTile(
                title: const Text('Status'),
                subtitle: Text(feedback.isResolved ? 'Resolved' : 'Pending'),
                leading: Icon(
                  feedback.isResolved ? Icons.check_circle : Icons.pending,
                  color:
                      feedback.isResolved ? Color(0xFF00A36C) : Colors.orange,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Feedback Message',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  feedback.message,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 24.0),
              if (!feedback.isResolved)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                      // Update the feedback status
                      setState(() {
                        final index = _feedbackList.indexOf(feedback);
                        if (index != -1) {
                          final updatedFeedback = Feedback(
                            id: feedback.id,
                            title: feedback.title,
                            customerName: feedback.customerName,
                            date: feedback.date,
                            message: feedback.message,
                            rating: feedback.rating,
                            isResolved: true,
                          );

                          _feedbackList[index] = updatedFeedback;
                          _filteredFeedbackList = List.from(_feedbackList);
                        }
                      });

                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Feedback marked as resolved'),
                          backgroundColor: Color(0xFF00A36C),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00A36C),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    child: const Text(
                      'Mark as Resolved',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              if (feedback.isResolved)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                      // Show response sent message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Response sent to customer'),
                          backgroundColor: Color(0xFF00A36C),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    child: const Text(
                      'Send Response',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _showAddFeedbackDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController customerController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
    int selectedRating = 3;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add Manual Feedback'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter feedback title',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: customerController,
                      decoration: const InputDecoration(
                        labelText: 'Customer Name',
                        hintText: 'Enter customer name',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        labelText: 'Feedback Message',
                        hintText: 'Enter feedback message',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Rating:'),
                        Row(
                          children: List.generate(
                            5,
                            (index) => IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedRating = index + 1;
                                });
                              },
                              icon: Icon(
                                index < selectedRating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                    if (titleController.text.isNotEmpty &&
                        customerController.text.isNotEmpty &&
                        messageController.text.isNotEmpty) {
                      final newFeedback = Feedback(
                        id: 'FB${1000 + _feedbackList.length}',
                        title: titleController.text,
                        customerName: customerController.text,
                        date: DateTime.now(),
                        message: messageController.text,
                        rating: selectedRating,
                        isResolved: false,
                      );

                      setState(() {
                        _feedbackList.insert(0, newFeedback);
                        _filteredFeedbackList = List.from(_feedbackList);
                      });

                      Navigator.pop(context);

                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Feedback added successfully'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      // Show error for incomplete form
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all required fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00A36C),
                  ),
                  child: const Text('Add'),
                ),
              ],
            );
          },
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

void main() {
  runApp(const MaterialApp(
    home: Feedbackpage(),
    debugShowCheckedModeBanner: false,
  ));
}
