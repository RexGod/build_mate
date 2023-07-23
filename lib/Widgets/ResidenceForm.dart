import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Residence_provider.dart' as resModel;

class ResidenceForm extends StatefulWidget {
  ResidenceForm({Key? key}) : super(key: key);

  @override
  State<ResidenceForm> createState() => _ResidenceFormState();
}

class _ResidenceFormState extends State<ResidenceForm> {
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _blockController = TextEditingController();

  final TextEditingController _unitController = TextEditingController();

  final TextEditingController _floorController = TextEditingController();

  final TextEditingController _parkingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      Provider.of<resModel.ResidenceProvider>(context, listen: false)
          .addResidence(
        _nameController.text,
        _blockController.text,
        _unitController.text,
        _phoneController.text,
        _floorController.text,
        _parkingController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'افزودن ساکن',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                //first
                TextFormField(
                  onSaved: (newValue) => _nameController.text = newValue!,
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    labelText: 'نام مالک',
                    labelStyle: TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        onSaved: (newValue) => _unitController.text = newValue!,
                        controller: _unitController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          labelText: 'واحد',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        onSaved: (newValue) =>
                            _floorController.text = newValue!,
                        controller: _floorController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          labelText: 'طبقه',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        onSaved: (newValue) =>
                            _blockController.text = newValue!,
                        controller: _blockController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          labelText: 'بلوک',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.4, // Set the desired width
                        child: TextFormField(
                          onSaved: (newValue) =>
                              _parkingController.text = newValue!,
                          controller: _parkingController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            labelText: 'تعداد پارکینگ',
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(height: 15),
                TextFormField(
                  onSaved: (newValue) => _phoneController.text = newValue!,
                  keyboardType: TextInputType.number,
                  controller: _phoneController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      labelText: 'شماره همراه',
                      labelStyle: TextStyle()),
                ),
                const SizedBox(height: 5),
                TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _submit();
                    },
                    child: Container(
                      height: 45,
                      width: 250,
                      decoration: const BoxDecoration(
                          color: Color(0xff407bff),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      alignment: Alignment.center,
                      child: const Text(
                        'ثبت ساکن جدید',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
