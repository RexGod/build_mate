import 'package:flutter/material.dart';

class CostItem extends StatelessWidget {
  const CostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      height: MediaQuery.of(context).size.height * 0.14,
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 63, 155, 242),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'نوع هزینه',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold), // Bold and change font size here
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_forever, size: 35),
                  )
                ],
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              color: const Color.fromARGB(146, 49, 141, 227),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'قیمت',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight
                                .bold), // Bold and change font size here
                      ),
                      Text(
                        ' 150000',
                        style: TextStyle(fontSize: 16), // Change font size here
                      ),
                      Text(
                        'تومان',
                        style: TextStyle(fontSize: 14), // Change font size here
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        'تاریخ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight
                                .bold), // Bold and change font size here
                      ),
                      Text(
                        ' 1402/05/02',
                        style: TextStyle(fontSize: 16), // Change font size here
                      ),
                      Text(
                        'چهارشنبه',
                        style: TextStyle(fontSize: 14), // Change font size here
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
                          backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 113, 166, 96),
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'پرداخت',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .bold), // Bold and change font size here
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Color.fromARGB(255, 0, 27, 114),
                        ),
                        label: const Text(
                          'پرداخت نشده',
                          style: TextStyle(
                            fontSize: 14, // Change font size here
                            fontWeight: FontWeight.bold, // Bold
                            color: Color.fromARGB(255, 0, 27, 114),
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
