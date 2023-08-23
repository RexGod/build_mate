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
    final String dateString = balanceData['date'] as String;
    final DateTime date = DateTime.parse(dateString);
    final Jalali jalaliDate = Jalali.fromDateTime(date);
    // Replace this with a ListView.builder to show transaction history
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.0),
          ListTile(
            leading: Icon(
              Icons.arrow_upward,
              color: Colors.green,
            ),
            title: type == 'sent'
                ? Text('برداشت $price از صندوق برای $name')
                : Text('واریز $price از آقای حسینی'),
            subtitle: Text('$jalaliDate'),
          ),
        ],
      ),
    );
  }
}
