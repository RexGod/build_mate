import 'package:flutter/material.dart';
import '../Provider/Residence_provider.dart' as resModel;

class ResidenceForm extends StatelessWidget {
  ResidenceForm({Key? key}) : super(key: key);
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _blockController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _parkingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Directionality(
          textDirection: TextDirection.rtl,
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
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    labelText: 'نام مالک',
                    labelStyle: TextStyle(fontSize: 13)),
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
                      controller: _unitController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        labelText: 'واحد',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _floorController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        labelText: 'طبقه',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _blockController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
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
                        controller: _parkingController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          labelText: 'تعداد پارکینگ',
                        ),
                      ),
                    ),
                  ]),
              const SizedBox(height: 15),
              TextFormField(
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
    );
  }
}
