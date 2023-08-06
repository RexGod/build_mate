import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../Provider/cost_Provider.dart';
import '../Screens/payScreen.dart';

class CostItem extends StatelessWidget {
  dynamic costData;
  CostItem(this.costData, {Key? key});

  @override
  Widget build(BuildContext context) {
    /* final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final bool status = arguments['status']; */
    final dataUsage = Provider.of<ProviderCost>(context);
    final String type = costData['type'];
    final int price = costData['price'];
    final String dateString = costData['date'] as String;
    final DateTime date = DateTime.parse(dateString);
    final Jalali jalaliDate = Jalali.fromDateTime(date);
    final int id = costData['id'];
    final bool status = costData['status'];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromRGBO(63, 155, 242, 1.0), width: 2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromRGBO(63, 155, 242, 1.0)),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(
                          63, 155, 242, 1.0), // Bold and change font size here
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: AlertDialog(
                              title: Text("حذف هزینه"),
                              content: Text("آیا از حذف هزینه مطمئن هستید؟"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text("خیر"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Provider.of<ProviderCost>(context,
                                            listen: false)
                                        .deleteCostItem(id); // Delete the item
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text("بله"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.delete_forever,
                        size: 35,
                        color: Colors.red), // Use red color for delete icon
                  )
                ],
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'قیمت',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(63, 155, 242,
                              1.0), // Bold and change font size here
                        ),
                      ),
                      Text(
                        '$price',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(
                                113, 166, 96, 1.0)), // Use green for price
                      ),
                      const Text(
                        'تومان',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(
                                128, 128, 128, 1.0)), // Use grey for currency
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'تاریخ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(63, 155, 242,
                              1.0), // Bold and change font size here
                        ),
                      ),
                      Text(
                        dataUsage.format1(jalaliDate),
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black), // Use black for date
                      ),
                      Text(
                        dataUsage.format2(jalaliDate),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(
                                128, 128, 128, 1.0)), // Use grey for day
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(63, 155, 242,
                                  1.0)), // Use green for button background
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            Payment.routeName,
                            arguments: {
                              'type': type,
                              'price': price,
                              'jalaliDate': jalaliDate
                            },
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'پرداخت',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Use white for button text
                            ),
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Color.fromRGBO(
                              0, 27, 114, 1.0), // Use blue for the icon
                        ),
                        // ignore: unrelated_type_equality_checks
                        label: status == false
                            ? const Text(
                                'پرداخت نشده',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(
                                      0, 27, 114, 1.0), // Use blue for the text
                                ),
                              )
                            : const Text(
                                'پرداخت با موفقیت',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(
                                      0, 27, 114, 1.0), // Use blue for the text
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
