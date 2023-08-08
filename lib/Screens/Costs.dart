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
    int totalRemainingPrice =
        Provider.of<ProviderCost>(context).totalRemainingPrice();
    int totalPriceHasBeenPay = totalPrice - totalRemainingPrice;
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
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color.fromARGB(255, 131, 184, 234),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ExpansionTile(
                  title: ListTile(
                    leading: const Text(
                      'جمع کل هزینه ها',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '$totalPrice',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  children: [
                    ListTile(
                      leading: const Text('هزینه باقی مانده کل',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      trailing: Text(
                        '$totalRemainingPrice',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: const Text('هزینه های انجام شده',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      trailing: Text(
                        '$totalPriceHasBeenPay',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
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
