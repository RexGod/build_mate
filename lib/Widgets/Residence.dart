import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResidenceList extends StatelessWidget {
  ResidenceList({
    Key? key,
    required this.id,
    required this.name,
    required this.floor,
    required this.block,
    required this.unit,
    this.debt,
    this.ask,
  });
  final String id;
  final String name;
  final String floor;
  final String block;
  final String unit;
  String? debt;
  String? ask;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xff8cb0ff),
      ),
      child: Card(
        color: const Color(0xff8cb0ff),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'بلوک: $block',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'واحد: $unit',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'طبقه: $floor',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            leading: Column(
              children: [
                Text(
                  'بدهی/ طلب',
                ),
              ],
            ),
            trailing: Column(
              children: [
                Container(
                  height: 30,
                  child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(206, 221, 255, 1),
                      child: Icon(Icons.person,
                          color: Color.fromRGBO(64, 123, 255, 1))),
                ),
                Text('$name'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
