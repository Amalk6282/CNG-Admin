import 'package:cng_admin/common_widget/custom_button.dart';
import 'package:cng_admin/common_widget/custom_search.dart';
import 'package:cng_admin/features/filling_station/add_edit_fillingstation_dialog.dart';
import 'package:cng_admin/features/filling_station/filling_station_card.dart';
import 'package:flutter/material.dart';

class FillingStaion extends StatelessWidget {
  const FillingStaion({super.key});

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
                  'Filling Station',
                  style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
                ),
              ),
              SizedBox(width: 300, child: CustomSearch(onSearch: (search) {})),
              SizedBox(
                width: 10,
              ),
              CustomButton(
                inverse: true,
                label: 'Add Filling Station',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AddEditFillingstationDialog());
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: List.generate(
                    10,
                    (index) => FillingStationCard(
                      url:
                          'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
                      station: 'H H FUELS',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
