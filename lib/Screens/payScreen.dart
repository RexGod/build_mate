import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../Provider/cost_Provider.dart';
import '../Widgets/appbar.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});
  static const routeName = 'Payment';

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController _priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dataUsage = Provider.of<ProviderCost>(context);
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String type = arguments['type'];
    final int price = arguments['price'];
    final Jalali jalaliDate = arguments['jalaliDate'];
    final int id = arguments['id'];
    final bool status = arguments['status'];
    final int remainingPrice = arguments['remainingPrice'];
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: MediaQuery.of(context).size.height * 0.08,
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: TextFormField(
                  enabled: false,
                  initialValue: type,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: 'نوع هزینه ',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: TextFormField(
                  enabled: false,
                  initialValue: dataUsage.format1(jalaliDate),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: 'تاریخ هزینه',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: TextFormField(
                  enabled: false,
                  initialValue: price.toString(),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: 'مبلغ هزینه (تومان)',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: TextFormField(
                  //initialValue: price.toString(),
                  textAlign: TextAlign.center,
                  controller: _priceController,
                  onSaved: (newValue) => double.tryParse(_priceController.text),
                  decoration: const InputDecoration(
                    labelText: 'مبلغ قابل پرداخت (تومان)',
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(63, 155, 242,
                          1.0)), // Use green for button background
                ),
                onPressed: () {
                  double priceValue =
                      double.tryParse(_priceController.text) ?? 0.0;

                  Provider.of<ProviderCost>(context, listen: false)
                      .updateprice(id, priceValue, remainingPrice.toDouble());
                  if (remainingPrice.toDouble() - priceValue == 0) {
                    Provider.of<ProviderCost>(context, listen: false)
                        .updateStatus(id, status);
                  }
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'ثبت پرداخت',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Use white for button text
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
