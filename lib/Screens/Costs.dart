import 'package:build_mate/Widgets/costItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/cost_Provider.dart';
import '../Widgets/appbar.dart';
import '../Widgets/costBottomSheet.dart';

class Cost extends StatelessWidget {
  const Cost({super.key});
  static const routeName = 'Cost';
  @override
  Widget build(BuildContext context) {
    
    Provider.of<ProviderCost>(context, listen: false).fetchCostItem();
    int totalPrice = Provider.of<ProviderCost>(context).total();
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        appBarHeight: MediaQuery.of(context).size.height * 0.08,
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 75),
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color.fromARGB(255, 131, 184, 234),
              height: MediaQuery.of(context).size.height * 0.06,
              child: Directionality(
                //the const must be deleted after dynamic value
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'جمع کل هزینه ها',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$totalPrice',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Consumer<ProviderCost>(
                builder: (context, providerCost, _) {
                  final List<dynamic> data = providerCost.costItems;
                  return ListView.builder(
                    itemBuilder: (context, index) => CostItem(data[index]),
                    itemCount: data.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              context: context,
              builder: (context) {
                return BottomSheetContent();
              },
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
