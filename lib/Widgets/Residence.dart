import 'package:flutter/material.dart';
import './../Provider/Residence_provider.dart';
import 'package:provider/provider.dart';

class ResidenceList extends StatelessWidget {
  const ResidenceList({Key? key});

  @override
  Widget build(BuildContext context) {
    final listOfResidence = Provider.of<ResidenceProvide>(context);
    final residenceList = listOfResidence.residenceList;

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
        itemCount: residenceList.length,
        itemBuilder: (context, index) {
          final residence = residenceList[index];

          return Container(
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
                    'بلوک: ${residence['block']}',
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    'طبقه: ${residence['floor']}',
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    'واحد: ${residence['unit']}',
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('name'),
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
          );
        },
      ),
    );
  }
}
