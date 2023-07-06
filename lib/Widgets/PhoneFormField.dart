import 'package:flutter/material.dart';

class PhoneNumberFormField extends StatefulWidget {
  @override
  _PhoneNumberFormFieldState createState() => _PhoneNumberFormFieldState();
}

class _PhoneNumberFormFieldState extends State<PhoneNumberFormField> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  @override
  void dispose() {
    _namecontroller.dispose();
    _phonecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Column(
            children: [
              TextFormField(
                controller: _namecontroller,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          strokeAlign: BorderSide.strokeAlignOutside),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  labelText: 'نام',
                ),
                validator: (value) {
                  // Phone number validation logic goes here
                  if (value == null || value.isEmpty) {
                    return 'لطفا نام خود را وارد نمایید';
                  }
                  // You can add more specific validation rules if needed
                  return null;
                },
                onChanged: (value) {
                  // Phone number formatting logic goes here (if needed)
                  // For example, you can format the phone number as the user types it
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _phonecontroller,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          strokeAlign: BorderSide.strokeAlignOutside),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  labelText: 'شماره تلفن',
                ),
                validator: (value) {
                  // Phone number validation logic goes here
                  if (value == null || value.isEmpty) {
                    return 'لطفا شماره تلفن خود را وارد نمایید';
                  }
                  // You can add more specific validation rules if needed
                  return null;
                },
                onChanged: (value) {
                  // Phone number formatting logic goes here (if needed)
                  // For example, you can format the phone number as the user types it
                },
              ),
            ],
          )),
    );
  }
}
