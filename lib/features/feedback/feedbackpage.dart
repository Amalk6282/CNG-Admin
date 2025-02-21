import 'package:cng_admin/features/feedback/feedbackcard.dart';
import 'package:flutter/material.dart';

class Feedbackpage extends StatelessWidget {
  const Feedbackpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Feedback',
                style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
              ),
              SizedBox(
                width: 450,
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ),
              SizedBox(
                width: 34,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF00A36C)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    minimumSize: const Size(80.0, 50.0),
                    backgroundColor: Colors.white),
                child: Text(
                  'Filter',
                  style: TextStyle(fontSize: 18.0, color: Color(0xFF00A36C)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Feedbackcard(),
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: 10),
          )
        ]));
  }
}
