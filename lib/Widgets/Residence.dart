import 'package:flutter/material.dart';
import './../Provider/Residence_provider.dart';
import 'package:provider/provider.dart';

class ResidenceList extends StatelessWidget {
  const ResidenceList({Key? key});

  @override
  Widget build(BuildContext context) {
    final list_of_residence = Provider.of<ResidenceProvide>(context);

    return ListView.builder(
      itemCount: list_of_residence.residenceList.length,
      itemBuilder: (context, index) {
        final residence = list_of_residence.residenceList[index];

        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xff8cb0ff),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(9),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    textDirection: TextDirection.rtl,
                    'بلوک: ${residence['block']}'),
                Text(
                    textDirection: TextDirection.rtl,
                    'طبقه: ${residence['floor']}'),
                Text(
                    textDirection: TextDirection.rtl,
                    'واحد: ${residence['unit']}'),
              ],
            ),
            trailing: Container(
              margin: const EdgeInsets.only(left: 80),
              child: const CircleAvatar(
                backgroundColor: Color.fromRGBO(206, 221, 255, 1),
                child: Icon(
                  Icons.person,
                  color: Color.fromRGBO(64, 123, 255, 1),
                ),
              ),
            ),
            leading: Text('بدهی/طلب:' /* ${residence.debt} */),
          ),
        );
      },
    );
  }
}
