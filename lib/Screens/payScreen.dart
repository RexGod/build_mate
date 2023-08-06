import 'package:build_mate/Screens/Costs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../Provider/cost_Provider.dart';
import '../Widgets/appbar.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});
  static const routeName = 'Payment';

  @override
  Widget build(BuildContext context) {
    final dataUsage = Provider.of<ProviderCost>(context);
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String type = arguments['type'];
    final int price = arguments['price'];
    final Jalali jalaliDate = arguments['jalaliDate'];
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
                  initialValue: price.toString(),
                  textAlign: TextAlign.center,
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
                  Navigator.of(context).pushNamed(Cost.routeName);
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
