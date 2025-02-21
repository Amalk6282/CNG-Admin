import 'package:flutter/material.dart';

class Feedbackcard extends StatelessWidget {
  const Feedbackcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          border: Border.all(color: Color(0xFF00A36C)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      height: 150,
      width: 1500,
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '#Title',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(80.0, 50.0),
                          backgroundColor: const Color(0xFF00A36C)),
                      child: Text(
                        'Details',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Veiw Details',
                        style: TextStyle(color: Color(0xFF00A36C)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
