import 'package:build_mate/Widgets/costItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/cost_Provider.dart';
import '../../Widgets/costBottomSheet.dart';

class Cost extends StatefulWidget {
  const Cost({super.key});
  static const routeName = 'Cost';

  @override
  State<Cost> createState() => _CostState();
}

class _CostState extends State<Cost> {
  var _isLoading = true;
  @override
  void initState() {
    super.initState();

    Provider.of<ProviderCost>(context, listen: false).fetchCostItem().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final format = Provider.of<ProviderCost>(context);
    int totalPrice = Provider.of<ProviderCost>(context).total();
    int totalRemainingPrice =
        Provider.of<ProviderCost>(context).totalRemainingPrice();
    int totalPriceHasBeenPay = totalPrice - totalRemainingPrice;
    String total = format.formatCurrencyRial(totalPrice);
    String remaining = format.formatCurrencyRial(totalRemainingPrice);
    String mostePay = format.formatCurrencyRial(totalPriceHasBeenPay);
    return Scaffold(
      extendBody: true,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
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
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            total,
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
                              remaining,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: const Text('هزینه های انجام شده',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            trailing: Text(
                              mostePay,
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
                        if (data.isEmpty) {
                          return const Center(
                            child: Text(
                              'هیچ هزینه ای اضافه نشده + لمس کنید',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: format.refresh,
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                CostItem(data[index]),
                            itemCount: data.length,
                          ),
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
