import 'package:build_mate/Widgets/costItem.dart';
import 'package:flutter/material.dart';

import '../Widgets/appbar.dart';

class Cost extends StatelessWidget {
  const Cost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        appBarHeight: MediaQuery.of(context).size.height * 0.08,
      ),
      body: Container(
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Color.fromARGB(255, 131, 184, 234),
              height: MediaQuery.of(context).size.height * 0.06,
              child: const Directionality(
                //the const must be deleted after dynamic value
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'جمع کل هزینه ها',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '150000 تومان',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) => CostItem(),
                itemCount: 7,
              ),
            )
          ],
        ),
      ),
    );
  }
}
