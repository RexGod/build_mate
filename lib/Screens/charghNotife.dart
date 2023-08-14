import 'package:build_mate/Widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../Widgets/drawer.dart';

class MultiStepForm extends StatefulWidget {
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
  static const routeName = 'charghNotify';
}

class _MultiStepFormState extends State<MultiStepForm> {
  String label = 'تعیین تاریخ';
  Jalali? picked;
  Jalali selectedDate = Jalali.fromDateTime(DateTime.now());
  bool _datePicked = false;
  int _currentStep = 0;
  final TextEditingController _titleController = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  List<String> options = [];
  @override
  void initState() {
    super.initState();
    _titleController.addListener(updateStepValidations);
    textController4.addListener(updateStepValidations);
  }

  void updateStepValidations() {
    setState(() {
      _stepValidations[0] = _titleController.text.isNotEmpty &&
          (_datePicked || label != 'تعیین تاریخ');

      _stepValidations[1] = textController4.text.isNotEmpty;
      _stepValidations[2] = options.isNotEmpty;
    });
  }

  void _submitForm() {
    _stepValidations[0] =
        _titleController.text.isNotEmpty && label != 'تعیین تاریخ';

    _stepValidations[1] = textController4.text.isNotEmpty;
    _stepValidations[2] = options.isNotEmpty;
  }

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
                    if (picked != null && picked != selectedDate) {
                      setState(() {
                        label = picked.formatShortDate();
                        _datePicked = true;
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
                child: Text(label),
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
                controller: textController4,
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
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.4, // Adjust the height as needed
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(options[index]),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    options.add('Option ${options.length + 1}');
                  });
                },
                child: const Text('Add Option'),
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
          onStepContinue: () {
            _submitForm();
            if (_stepValidations[_currentStep]) {
              setState(() {
                _currentStep += 1;
              });
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
