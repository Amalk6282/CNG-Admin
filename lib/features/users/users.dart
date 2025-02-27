import 'package:cng_admin/common_widget/custom_search.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 60),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Users',
                  style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
                ),
              ),
              SizedBox(
                width: 300,
                child: CustomSearch(onSearch: (search) {}),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Material(
              child: DataTable2(
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
        ],
      ),
    );
  }
}
