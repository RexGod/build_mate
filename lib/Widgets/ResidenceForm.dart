import 'package:flutter/material.dart';

class ResidenceForm extends StatelessWidget {
  const ResidenceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
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
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(strokeAlign: BorderSide.strokeAlignCenter),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    labelText: 'واحد',
                  ),
                )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    labelText: 'طبقه',
                  ),
                )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    labelText: 'بلوک',
                  ),
                ))
              ],
            ),
            SizedBox(height: 15),
            Expanded(
                child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(strokeAlign: BorderSide.strokeAlignOutside),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                labelText: 'تعداد پارکینگ',
              ),
            )),
          ],
        ),
      ),
    );
  }
}
