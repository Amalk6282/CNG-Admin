import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return UsersCard();
  }
}

class UsersCard extends StatelessWidget {
  const UsersCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Users',
                  style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
                ),
                SizedBox(
                  width: 600,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      minimumSize: const Size(80.0, 50.0),
                      backgroundColor: const Color(0xFF414141)),
                  child: Text(
                    'Add User',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                width: 1200,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'John',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx101',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'Thomas',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx123',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'Antony',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx112',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'Michael',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx132',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'Thiago',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx141',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'James',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx142',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'Mathew',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx151',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'Alex',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx103',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'Lewis',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx131',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 250,
                            width: 180,
                            color: Color(0xFFE7EEE7),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Icon(
                                  Icons.supervised_user_circle_rounded,
                                  size: 50,
                                ),
                                Text(
                                  'Wilson',
                                  style: TextStyle(
                                      fontSize: 36, color: Colors.black),
                                ),
                                Text(
                                  'UID:xxx185',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Manage'),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
