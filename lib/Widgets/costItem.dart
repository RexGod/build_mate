import 'package:flutter/material.dart';

class CostItem extends StatelessWidget {
  const CostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(63, 155, 242, 1.0), width: 2),
        borderRadius: BorderRadius.only(
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
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromRGBO(63, 155, 242, 1.0)),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'نوع هزینه',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(
                          63, 155, 242, 1.0), // Bold and change font size here
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
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
                  const Column(
                    children: [
                      Text(
                        'قیمت',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(63, 155, 242,
                              1.0), // Bold and change font size here
                        ),
                      ),
                      Text(
                        ' 150000',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(
                                113, 166, 96, 1.0)), // Use green for price
                      ),
                      Text(
                        'تومان',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(
                                128, 128, 128, 1.0)), // Use grey for currency
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        'تاریخ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(63, 155, 242,
                              1.0), // Bold and change font size here
                        ),
                      ),
                      Text(
                        ' 1402/05/02',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black), // Use black for date
                      ),
                      Text(
                        'چهارشنبه',
                        style: TextStyle(
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
                              Color.fromRGBO(63, 155, 242,
                                  1.0)), // Use green for button background
                        ),
                        onPressed: () {},
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
                        label: const Text(
                          'پرداخت نشده',
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
