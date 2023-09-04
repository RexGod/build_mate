import 'package:build_mate/Model/balanceModel.dart';
import 'package:build_mate/Provider/balance_Provider.dart';
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
    final int remainingPricecost = arguments['remainingPrice'];
    String balanceId = arguments['balance_id'];

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
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(63, 155, 242, 1.0),
                  ),
                ),
                onPressed: () async {
                  double priceValue =
                      double.tryParse(_priceController.text) ?? 0.0;

                  // Get the current remaining balance from ProviderBalance
                  final providerBalance =
                      Provider.of<ProviderBalance>(context, listen: false);
                  int remainingPrice =
                      providerBalance.calculateBalanceRemaining();

                  // Check if subtracting the priceValue results in a negative remaining balance
                  if (remainingPrice - priceValue < 0) {
                    final snackBar = SnackBar(
                      dismissDirection: DismissDirection.down,
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.red,
                      content: Text("مبلغ وارد شده باقیمانده را منفی می‌کند."),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }

                  // Proceed with the update
                  Provider.of<ProviderCost>(context, listen: false).updateprice(
                      context, id, priceValue, remainingPricecost.toDouble());

                  if (remainingPricecost.toDouble() - priceValue == 0) {
                    Provider.of<ProviderBalance>(context, listen: false)
                        .addBalancecost(
                      balanceModel(balanceId, price.toDouble(), 'recive', type),
                    );
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
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
