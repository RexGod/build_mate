// ignore_for_file: library_private_types_in_public_api

import 'package:build_mate/Model/costModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/cost_Provider.dart';

// ignore: use_key_in_widget_constructors
class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  String? _selectedType;
  final TextEditingController _priceController = TextEditingController();

  // List of available options for the DropdownButton
  final List<Map<String, dynamic>> _options = [
    {'text': 'قبض آب', 'color': Colors.blue, 'value': 'قبض آب'},
    {'text': 'قبض برق', 'color': Colors.yellow, 'value': 'قبض برق'},
    {'text': 'قبض گاز', 'color': Colors.grey, 'value': 'قبض گاز'},
    {'text': 'حقوق سرایدار', 'color': Colors.blue, 'value': 'حقوق سرایدار'},
    {'text': 'حقوق نگهبان', 'color': Colors.black, 'value': 'حقوق نگهبان'},
    {
      'text': 'تعمیرات آسانسور',
      'color': Colors.red,
      'value': 'تعمیرات آسانسور'
    },
    {'text': 'مواد شست و شو', 'color': Colors.purple, 'value': 'مواد شست و شو'},
    {'text': 'فضای سبز', 'color': Colors.greenAccent, 'value': 'فضای سبز'},
    {'text': 'موارد دیگر', 'color': Colors.purple, 'value': 'موارد دیگر'},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              'ثبت هزینه جدید',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 215, 215),
              ),
              child: DropdownButton(
                underline: Container(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                isExpanded: true,
                value: _selectedType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedType = newValue;
                  });
                },
                elevation: 0,
                items: _options.map<DropdownMenuItem<String>>((option) {
                  return DropdownMenuItem<String>(
                    value: option['value'],
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        height: 350,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: option['color'],
                              width: 3.5,
                            ),
                          ),
                        ),
                        width: double.maxFinite,
                        child: Text(option['text'] as String),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _priceController,
                onSaved: (newValue) => double.tryParse(_priceController.text),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: 'مبلغ هزینه (تومان)',
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                //controller: ,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'توضیحاتی بنویسید',
                  labelText: 'توضیحات',
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                double priceValue =
                    double.tryParse(_priceController.text) ?? 0.0;

                Provider.of<ProviderCost>(context, listen: false).InsertCost(
                    CostModel(priceValue, _selectedType.toString()));
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'ثبت هزینه',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
