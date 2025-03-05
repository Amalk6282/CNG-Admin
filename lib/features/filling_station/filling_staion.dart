import 'package:cng_admin/common_widget/custom_button.dart';
import 'package:cng_admin/common_widget/custom_search.dart';
import 'package:cng_admin/features/filling_station/add_edit_fillingstation_dialog.dart';
import 'package:cng_admin/features/filling_station/filling_station_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

import '../../common_widget/custom_alert_dialog.dart';
import '../../util/check_login.dart';
import 'filling_station_bloc/filling_stations_bloc.dart';

class FillingStaion extends StatefulWidget {
  const FillingStaion({super.key});

  @override
  State<FillingStaion> createState() => _FillingStaionState();
}

class _FillingStaionState extends State<FillingStaion> {
  final FillingStationsBloc _fillingstationsBloc = FillingStationsBloc();

  Map<String, dynamic> params = {
    'query': null,
  };

  List<Map> _fillingstations = [];

  @override
  void initState() {
    checkLogin(context);
    getFillingStations();
    super.initState();
  }

  void getFillingStations() {
    _fillingstationsBloc.add(GetAllFillingStationsEvent(params: params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _fillingstationsBloc,
      child: BlocConsumer<FillingStationsBloc, FillingStationsState>(
        listener: (context, state) {
          if (state is FillingStationsFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: state.message,
                primaryButton: 'Try Again',
                onPrimaryPressed: () {
                  getFillingStations();
                  Navigator.pop(context);
                },
              ),
            );
          } else if (state is FillingStationsGetSuccessState) {
            _fillingstations = state.fillingstations;
            Logger().w(_fillingstations);
            setState(() {});
          } else if (state is FillingStationsSuccessState) {
            getFillingStations();
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 60),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Filling Station',
                        style:
                            TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
                      ),
                    ),
                    SizedBox(
                        width: 300,
                        child: CustomSearch(onSearch: (search) {
                          params['query'] = search;
                          getFillingStations();
                        })),
                    SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      inverse: true,
                      label: 'Add Filling Station',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => BlocProvider.value(
                                  value: _fillingstationsBloc,
                                  child: AddEditFillingstationDialog(),
                                ));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                if (state is FillingStationsLoadingState)
                  LinearProgressIndicator(),
                if (state is FillingStationsGetSuccessState &&
                    _fillingstations.isEmpty)
                  Center(
                    child: Text("No Filling Stations found!"),
                  ),
                if (state is FillingStationsGetSuccessState &&
                    _fillingstations.isNotEmpty)
                  Expanded(
                    child: ListView(
                      children: [
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: List.generate(
                            _fillingstations.length,
                            (index) => FillingStationCard(
                              url: _fillingstations[index]['image_url'],
                              station: _fillingstations[index]['name'],
                              onManage: () {
                                showStationDetails(
                                    context, _fillingstations[index]);
                              },
                              onEdit: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => BlocProvider.value(
                                          value: _fillingstationsBloc,
                                          child: AddEditFillingstationDialog(
                                            fillingstationDetails:
                                                _fillingstations[index],
                                          ),
                                        ));
                              },
                              onDelete: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
