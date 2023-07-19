import 'package:flutter/material.dart';

class ResidenceList extends StatelessWidget {
  ResidenceList(
      {Key? key,
      required this.id,
      required this.name,
      required this.floor,
      required this.block,
      required this.unit,
      this.debt,
      this.ask, });
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
        height: MediaQuery.of(context).size.height * 0.7,
        child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xff8cb0ff),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(5),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  block,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  floor,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  unit,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name),
                Container(
                  margin: const EdgeInsets.only(left: 70),
                  child: const CircleAvatar(
                    backgroundColor: Color.fromRGBO(206, 221, 255, 1),
                    child: Icon(
                      Icons.person,
                      color: Color.fromRGBO(64, 123, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
            leading: Text('بدهی/طلب:' /* ${residence.debt} */),
          ),
        ));
  }
}
