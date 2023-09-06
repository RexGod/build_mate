import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/balanceModel.dart';
import '../Provider/Residence_provider.dart';
import '../Provider/balance_Provider.dart';
import '../Provider/chargh_provider.dart';

class paychargh extends StatelessWidget {
  static const route_Name = './paychargh';

  @override
  Widget build(BuildContext context) {
    final residence_data = Provider.of<ResidenceProvider>(context);
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int chargh_id = arguments['chargh_id'];
    final String balance_id = arguments['balance_id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Resident List'),
      ),
      body: FutureBuilder<double>(
        future: Provider.of<ProviderChargh>(context).fetchPrice(chargh_id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final double price = snapshot.data ?? 0.0;
            return GridView.builder(
              itemCount: residence_data.residenceList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final residence = residence_data.residenceList[index];
                final String name = residence['name_of_Owner'];
                final int unit = residence['unit'];
                final String id = residence['id'];
                final int debt = residence['Debt'];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'واحد: $unit',
                        style: TextStyle(fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          try {
                            Provider.of<ResidenceProvider>(context,
                                    listen: false)
                                .updatedebt(id, price);
                            Provider.of<ProviderBalance>(context, listen: false)
                                .addBalancecost(balanceModel(balance_id,
                                    price.toDouble(), 'sent', name));
                          } catch (error) {
                            rethrow;
                          }
                        },
                        child: Text('Pay'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'هزینه شارژ $debt',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
