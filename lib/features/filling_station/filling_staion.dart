import 'package:cng_admin/features/filling_station/filling_station_card.dart';
import 'package:flutter/material.dart';

class FillingStaion extends StatelessWidget {
  const FillingStaion({super.key});

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
                  'Filling Station',
                  style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
                ),
                SizedBox(
                  width: 450,
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
                    'Add Station',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 550,
              width: 1250,
              color: Colors.white,
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    children: [
                      FillingStationCard(
                          url:
                              'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
                          station: 'FFFS Kannur'),
                      SizedBox(
                        width: 30,
                      ),
                      FillingStationCard(
                          url:
                              'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
                          station: 'MS HS PP FUELS'),
                      SizedBox(
                        width: 30,
                      ),
                      FillingStationCard(
                          url:
                              'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
                          station: 'IOAGPL-HPCL CNG Station'),
                      SizedBox(
                        width: 25,
                      ),
                      FillingStationCard(
                          url:
                              'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
                          station: 'S R FUELS'),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      FillingStationCard(
                          url:
                              'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
                          station: 'N F FUELS'),
                      SizedBox(
                        width: 30,
                      ),
                      FillingStationCard(
                          url:
                              'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
                          station: 'Enirates Fuel Company'),
                      SizedBox(
                        width: 30,
                      ),
                      FillingStationCard(
                          url:
                              'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
                          station: 'Shedde Oils'),
                      SizedBox(
                        width: 26,
                      ),
                      FillingStationCard(
                          url:
                              'https://thumbs.dreamstime.com/b/new-delhi-india-petrol-diesel-being-filled-car-indian-oil-pump-to-get-tank-full-pollution-checking-centers-puc-193287003.jpg',
                          station: 'H H FUELS'),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
