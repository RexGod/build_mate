import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../Provider/cost_Provider.dart';

// ignore: camel_case_types, must_be_immutable
class balanceItems extends StatelessWidget {
  dynamic balanceData;
  balanceItems(this.balanceData, {super.key});

  @override
  Widget build(BuildContext context) {
    var format = Provider.of<ProviderCost>(context);
    final String name = balanceData['name'];
    final String type = balanceData['type'];
    final int p = balanceData['price'];
    final String price = format.formatCurrencyRial(p);
    //final String dateString =  as String;
    final DateTime date = DateTime.parse(balanceData['date']);
    final Jalali jalaliDate = Jalali.fromDateTime(date);
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.0),
          ListTile(
            leading: type == 'sent'
                ? Icon(
                    Icons.arrow_upward,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.arrow_downward,
                    color: Color.fromARGB(255, 185, 77, 77),
                  ),
            title: type == 'sent'
                ? Text('واریز $price به صندوق توسط $name')
                : Text('برداشت $price از صندوق برای $name'),
            subtitle: Text(format.format1(jalaliDate)),
          ),
        ],
      ),
    );
  }
}
