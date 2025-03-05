import 'package:cng_admin/common_widget/custom_alert_dialog.dart';
import 'package:cng_admin/common_widget/custom_image_picker_button.dart';
import 'package:cng_admin/common_widget/custom_text_formfield.dart';
import 'package:cng_admin/util/value_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../common_widget/custom_button.dart';
import '../../common_widget/custom_map.dart';
import 'filling_station_bloc/filling_stations_bloc.dart';

class AddEditFillingstationDialog extends StatefulWidget {
  final Map? fillingstationDetails;
  const AddEditFillingstationDialog({super.key, this.fillingstationDetails});

  @override
  State<AddEditFillingstationDialog> createState() =>
      _AddEditFillingstationDialogState();
}

class _AddEditFillingstationDialogState
    extends State<AddEditFillingstationDialog> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _addressLineController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PlatformFile? coverImage;
  LatLng? _selectedLocation;

  @override
  void initState() {
    if (widget.fillingstationDetails != null) {
      _nameController.text = widget.fillingstationDetails!['name'];
      _phonenoController.text = widget.fillingstationDetails!['phone'];
      _stateController.text = widget.fillingstationDetails!['state'];
      _districtController.text = widget.fillingstationDetails!['district'];
      _placeController.text = widget.fillingstationDetails!['place'];
      _pincodeController.text = widget.fillingstationDetails!['pincode'];
      _addressLineController.text =
          widget.fillingstationDetails!['address_line'];

      if (widget.fillingstationDetails!['location'] != null) {
        _selectedLocation = LatLng(
            widget.fillingstationDetails!['location_latitude'],
            widget.fillingstationDetails!['location_longitude']);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FillingStationsBloc, FillingStationsState>(
      listener: (context, state) {
        if (state is FillingStationsSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomAlertDialog(
          isLoading: state is FillingStationsLoadingState,
          title: 'Add Filling Station',
          content: Flexible(
              child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                CustomImagePickerButton(
                  selectedImage: widget.fillingstationDetails?['image_url'],
                  onPick: (pick) {
                    coverImage = pick;
                    setState(() {});
                  },
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                ),
                if (widget.fillingstationDetails == null)
                  CustomTextFormField(
                    labelText: 'Email',
                    controller: _emailController,
                    validator: emailValidator,
                    isLoading: state is FillingStationsLoadingState,
                  ),
                if (widget.fillingstationDetails == null)
                  SizedBox(
                    height: 10,
                  ),
                if (widget.fillingstationDetails == null)
                  CustomTextFormField(
                    labelText: 'Password',
                    controller: _passwordController,
                    validator: passwordValidator,
                    isLoading: state is FillingStationsLoadingState,
                  ),
                if (widget.fillingstationDetails == null)
                  SizedBox(
                    height: 10,
                  ),
                CustomTextFormField(
                  labelText: 'Name',
                  controller: _nameController,
                  validator: alphabeticWithSpaceValidator,
                  isLoading: state is FillingStationsLoadingState,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  labelText: 'Phone No.',
                  controller: _phonenoController,
                  validator: phoneNumberValidator,
                  isLoading: state is FillingStationsLoadingState,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Address:',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  labelText: 'State',
                  controller: _stateController,
                  validator: alphabeticWithSpaceValidator,
                  isLoading: state is FillingStationsLoadingState,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  labelText: 'District',
                  controller: _districtController,
                  validator: alphabeticWithSpaceValidator,
                  isLoading: state is FillingStationsLoadingState,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  labelText: 'Place',
                  controller: _placeController,
                  validator: alphabeticWithSpaceValidator,
                  isLoading: state is FillingStationsLoadingState,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  labelText: 'PIN CODE',
                  controller: _pincodeController,
                  validator: pincodeValidator,
                  isLoading: state is FillingStationsLoadingState,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  labelText: 'Address Line',
                  controller: _addressLineController,
                  validator: notEmptyValidator,
                  isLoading: state is FillingStationsLoadingState,
                ),
                CustomButton(
                  label: _selectedLocation != null
                      ? 'Change Location'
                      : 'Select Location',
                  iconData: Icons.location_on_sharp,
                  onPressed: () async {
                    LatLng? tempLocation = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CustomMap(
                          selectedLocation: _selectedLocation,
                        ),
                      ),
                    );

                    if (tempLocation != null) {
                      _selectedLocation = tempLocation;
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          )),
          primaryButton: 'Submit',
          onPrimaryPressed: () {
            if (_formKey.currentState!.validate() &&
                ((coverImage != null) ||
                    widget.fillingstationDetails != null)) {
              Map<String, dynamic> details = {
                'name': _nameController.text,
                'email': _emailController.text,
                'phone': _phonenoController.text,
                'state': _stateController.text,
                'district': _districtController.text,
                'place': _placeController.text,
                'pincode': _pincodeController.text,
                'address_line': _addressLineController.text,
                'location': _selectedLocation != null
                    ? 'POINT(${_selectedLocation?.longitude} ${_selectedLocation?.latitude})'
                    : null,
                'location_longitude': _selectedLocation?.longitude,
                'location_latitude': _selectedLocation?.latitude,
              };

              if (coverImage != null) {
                details['image'] = coverImage!.bytes;
                details['image_name'] = coverImage!.name;
              }

              if (widget.fillingstationDetails != null) {
                BlocProvider.of<FillingStationsBloc>(context).add(
                  EditFillingStationEvent(
                    fillingstationId: widget.fillingstationDetails!['id'],
                    fillingstationDetails: details,
                  ),
                );
              } else {
                BlocProvider.of<FillingStationsBloc>(context).add(
                  AddFillingStationEvent(
                    fillingstationDetails: details,
                  ),
                );
              }
            }
          },
        );
      },
    );
  }
}
