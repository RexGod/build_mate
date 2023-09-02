import 'package:build_mate/Provider/chargh_provider.dart';
import 'package:build_mate/Screens/payChargh.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types, must_be_immutable
class billItem extends StatelessWidget {
  dynamic billData;
  billItem(this.billData, {super.key});

  @override
  Widget build(BuildContext context) {
    final dataUsage = Provider.of<ProviderChargh>(context);
    final String dateString = billData['deadLinetime'] as String;
    final DateTime date = DateTime.parse(dateString);
    final Jalali jalaliDate = Jalali.fromDateTime(date);
    final int charghId = billData['id'];
    String balanceId = billData['balance_id'];
    return ListTile(
      contentPadding: const EdgeInsets.all(10), // Padding around each item
      title: Text(
        billData['name'],
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      subtitle: Text(
        dataUsage.format1(jalaliDate),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),

      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.of(context)
            .pushNamed(paychargh.route_Name, arguments: {'chargh_id':charghId , 'balance_id': balanceId});
      },
    );
  }
}
