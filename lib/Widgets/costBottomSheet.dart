import 'package:flutter/material.dart';

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  String _selectedOption = 'Option 1';
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
                value: _selectedOption,
                onChanged: (newValue) {
                  setState(() {
                    _selectedOption = newValue!;
                  });
                },
                elevation: 0,
                items: [
                  DropdownMenuItem(
                    value: 'Option 1',
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.blue,
                          width: 3.5,
                        ))),
                        child: Text('قبض آب '),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Option 2',
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.yellow,
                          width: 3.5,
                        ))),
                        child: Text(
                          'قبض برق',
                        ),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Option 3',
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.grey,
                          width: 3.5,
                        ))),
                        child: Text(
                          'قبض گاز',
                        ),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Option 4',
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.blue,
                          width: 3.5,
                        ))),
                        child: Text(
                          'حقوق سرایدار',
                        ),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Option 5',
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.black,
                          width: 3.5,
                        ))),
                        child: Text(
                          'حقوق نگهبان',
                        ),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Option 6',
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.red,
                          width: 3.5,
                        ))),
                        child: Text(
                          'تعمیرات آسانسور',
                        ),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Option 7',
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.purple,
                          width: 3.5,
                        ))),
                        child: Text(
                          'مواد شست و شو',
                        ),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Option 8',
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.greenAccent,
                          width: 3.5,
                        ))),
                        child: Text(
                          'فضای سبز',
                        ),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Option 9',
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 350,
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.purple,
                          width: 3.5,
                        ))),
                        child: Text(
                          'موارد دیگر',
                        ),
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
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
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
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
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
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
