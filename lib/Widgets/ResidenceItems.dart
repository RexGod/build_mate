import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Residence_provider.dart';

// ignore: must_be_immutable
class ResidenceItems extends StatelessWidget {
  dynamic residenceData;
  ResidenceItems(this.residenceData, {Key? key});

  @override
  Widget build(BuildContext context) {
    final String id = residenceData['id'];
    final String name = residenceData['name_of_Owner'];
    final String block = residenceData['block'];
    final String floor = residenceData['floor'];
    final int unit = residenceData['unit'];
    final int parking = residenceData['number_of_parking'];
    //final String status = residenceData['status'];
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.redAccent,
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text(
              'مطمِین هستید ؟ ',
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('خیر'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('بله'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Future.delayed(const Duration(milliseconds: 100), () {
          Provider.of<ResidenceProvider>(context, listen: false)
              .removeResidence(id);
        });
        ScaffoldMessenger.of(context)
            .removeCurrentSnackBar(); // Clear any existing SnackBars.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("آیتم با موفقیت حذف شد."),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(26, 0, 162, 255),
            border: Border.all(
              color: const Color.fromARGB(255, 0, 162, 255),
            )),
        child: ListTile(
          title: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color.fromRGBO(206, 221, 255, 1),
                      child: Icon(
                        Icons.person,
                        color: Color.fromRGBO(64, 123, 255, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(name),
                  ],
                ),
                const SizedBox(
                    width:
                        20), // Add space between the first and second columns
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('بلوک',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(block),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('طبقه',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(floor),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('واحد',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('$unit'),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                    width:
                        20), // Add space between the second and third columns
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('$parking : تعداد پارکینگ',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('وضعیت بدهی',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text('data'),
                  ],
                ),
              ],
            ),

            /* child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(206, 221, 255, 1),
                        child: Icon(
                          Icons.person,
                          color: Color.fromRGBO(64, 123, 255, 1),
                        ),
                      ),
                      Text(name),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'بلوک: $block',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'واحد: $unit',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'طبقه: $floor',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'بدهی/طلب',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        debt != null ? 'بدهی: $debt' : 'طلب: $ask',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ), */
          ),
        ),
      ),
    );
  }
}
