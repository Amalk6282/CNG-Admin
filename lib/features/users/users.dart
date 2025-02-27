import 'package:cng_admin/common_widget/custom_search.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return UserTable();
  }
}

class UserTable extends StatelessWidget {
  const UserTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
          child: Row(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Users',
                style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
              ),
              Spacer(),
              SizedBox(
                  width: 400, child: CustomSearch(onSearch: (onSearch) {})),
              SizedBox(
                width: 45,
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
                  'Search',
                  style: TextStyle(fontSize: 18.0, color: Color(0xFF00A36C)),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Material(
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text('Serial No.'),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Name',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'U ID',
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(
                    7,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text('1')),
                        DataCell(Text('Sarah')),
                        DataCell(Text('XXXXX0213')),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
