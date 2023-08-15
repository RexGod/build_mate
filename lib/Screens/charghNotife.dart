import 'package:build_mate/Model/charghModel.dart';
import 'package:build_mate/Provider/chargh_provider.dart';
import 'package:build_mate/Widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

import '../Provider/Residence_provider.dart';
import '../Widgets/drawer.dart';

class MultiStepForm extends StatefulWidget {
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
  static const routeName = 'charghNotify';
}

class _MultiStepFormState extends State<MultiStepForm> {
  String label = 'تعیین تاریخ';
  int _insertedChargeId = -1;

  bool _datePicked = false;
  int _currentStep = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  List<String> options = [];
  @override
  void initState() {
    super.initState();
    _titleController.addListener(updateStepValidations);
    _priceController.addListener(updateStepValidations);
  }

  void updateStepValidations() {
    setState(() {
      _stepValidations[0] = _titleController.text.isNotEmpty &&
          (_datePicked || label != 'تعیین تاریخ');

      _stepValidations[1] = _priceController.text.isNotEmpty;
      _stepValidations[2] = options.isNotEmpty;
    });
  }

  void _submitForm() {
    _stepValidations[0] =
        _titleController.text.isNotEmpty && label != 'تعیین تاریخ';

    _stepValidations[1] = _priceController.text.isNotEmpty;
    _stepValidations[2] = options.isNotEmpty;
  }

  Jalali selectedDate = Jalali.fromDateTime(DateTime.now());

  List<Step> getSteps() => [
        Step(
          isActive: _currentStep >= 0,
          title: const Text(''),
          label: const Text('ثبت نوع شارژ'),
          content: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'عنوان'),
              ),
              //Date picker
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    Jalali? picked = await showPersianDatePicker(
                      context: context,
                      initialDate: Jalali.now(),
                      firstDate: Jalali(1385, 8),
                      lastDate: Jalali(1450, 9),
                      initialEntryMode: PDatePickerEntryMode.calendar,
                      initialDatePickerMode: PDatePickerMode.day,
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData(
                            dialogTheme: const DialogTheme(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      setState(() {
                        label = picked.formatShortDate();
                        _datePicked = true;
                        selectedDate = picked;
                      });
                      updateStepValidations();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    // Background color of the button
                    elevation: 4, // Elevation of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  icon: const Icon(Icons.date_range),
                  label: Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Container(
                child: label.isEmpty ? Text('آخرین مهلت پرداخت') : Text(label),
              )
            ],
          ),
        ),
        Step(
          title: const Text(''),
          label: const Text('تعیین هزینه شارژ'),
          isActive: _currentStep >= 1,
          content: Column(
            children: [
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'مبلغ شارژ'),
              ),
            ],
          ),
        ),
        Step(
          label: const Text('اعلام شارژ'),
          title: const Text(''),
          isActive: _currentStep >= 2,
          content: Column(
            children: [
              ElevatedButton.icon(
                
                onPressed: () {
                 double newPrice = double.tryParse(_priceController.text) ?? 0.0;
          Provider.of<ResidenceProvider>(context, listen: false)
              .updateAllPrices(newPrice);
                },
                icon: Icon(Icons.notification_add),
                label: Text('اعلام شارژ'),
              ),
            ],
          ),
        ),
      ];

  List<bool> _stepValidations = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: MediaQuery.of(context).size.height * 0.08,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        backgroundColor: Colors.blue,
        child: const drawerWidget(),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stepper(
          controlsBuilder: (context, details) {
            bool isFirstStep = details.currentStep == 0;
            bool isLastStep = details.currentStep == 2;
            bool isCurrentStepValid = _stepValidations[details.currentStep];

            return Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Row(
                children: [
                  if (!isFirstStep)
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: isLastStep
                            ? const Text('بازگشت')
                            : const Text('مرحله قبل'),
                        onPressed:
                            isCurrentStepValid ? details.onStepContinue : null,
                      ),
                    ),
                  const SizedBox(width: 15),
                  if (!isLastStep)
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: isCurrentStepValid
                              ? Colors.blue // Valid step color
                              : Colors.grey, // Disabled step color
                        ),
                        child: isFirstStep
                            ? const Text('ادامه')
                            : const Text('مرحله بعد'),
                        onPressed: isCurrentStepValid
                            ? details.onStepContinue
                            : null, // Disable button if step is not valid
                      ),
                    ),
                ],
              ),
            );
          },
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: _currentStep,
          onStepContinue: () async {
            _submitForm();
            if (_stepValidations[_currentStep]) {
              if (_currentStep == 0) {
                final insertedId =
                    await Provider.of<ProviderChargh>(context, listen: false)
                        .insertChargh(charghModel(
                            selectedDate.toDateTime(), _titleController.text));
                if (insertedId >= 0) {
                  setState(() {
                    _insertedChargeId = insertedId;
                    _currentStep += 1;
                  });
                } else {
                  // Handle insert error
                }
              } else if (_currentStep == 1) {
                double price = double.tryParse(_priceController.text) ?? 0.0;
                Provider.of<ProviderChargh>(context, listen: false)
                    .insertPrice(_insertedChargeId, price);
                setState(() {
                  _currentStep += 1;
                });
              }
            }
          },
          onStepCancel: () {
            setState(() {
              _currentStep -= 1;
            });
          },
        ),
      ),
    );
  }
}
