import 'package:build_mate/Provider/chargh_provider.dart';
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
    return ListTile(
      contentPadding: EdgeInsets.all(10), // Padding around each item
      title: Text(
        billData['name'],
        style: TextStyle(
          fontSize: 18, // Adjust text size
          fontWeight: FontWeight.bold, // Bold text
          color: Colors.blue, // Text color
        ),
      ),
      subtitle: Text(
        dataUsage.format1(jalaliDate),
        style: TextStyle(
          fontSize: 14, // Adjust subtitle text size
          color: Colors.grey, // Subtitle text color
        ),
      ),

      trailing: Icon(Icons.arrow_forward), // Trailing icon
      onTap: () {},
    );
  }
}
