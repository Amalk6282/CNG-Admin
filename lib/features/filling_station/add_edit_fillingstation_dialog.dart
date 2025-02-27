import 'package:cng_admin/common_widget/custom_alert_dialog.dart';
import 'package:cng_admin/common_widget/custom_image_picker_button.dart';
import 'package:cng_admin/common_widget/custom_text_formfield.dart';
import 'package:cng_admin/util/value_validator.dart';
import 'package:flutter/material.dart';

class AddEditFillingstationDialog extends StatefulWidget {
  const AddEditFillingstationDialog({super.key});

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

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Filling Station',
      content: Flexible(
          child: ListView(
        shrinkWrap: true,
        children: [
          CustomImagePickerButton(
            onPick: (pick) {},
            width: double.infinity,
          ),
          SizedBox(
            height: 20,
          ),
          //TODO:loading
          CustomTextFormField(
            labelText: 'Email',
            controller: _emailController,
            validator: emailValidator,
            isLoading: false,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            labelText: 'Password',
            controller: _passwordController,
            validator: passwordValidator,
            isLoading: false,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            labelText: 'Name',
            controller: _nameController,
            validator: alphabeticWithSpaceValidator,
            isLoading: false,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            labelText: 'Phone No.',
            controller: _phonenoController,
            validator: phoneNumberValidator,
            isLoading: false,
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
            isLoading: false,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            labelText: 'District',
            controller: _districtController,
            validator: alphabeticWithSpaceValidator,
            isLoading: false,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            labelText: 'Place',
            controller: _placeController,
            validator: alphabeticWithSpaceValidator,
            isLoading: false,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            labelText: 'PIN CODE',
            controller: _pincodeController,
            validator: pincodeValidator,
            isLoading: false,
          )
        ],
      )),
      primaryButton: 'Submit',
      onPrimaryPressed: () {},
    );
  }
}
