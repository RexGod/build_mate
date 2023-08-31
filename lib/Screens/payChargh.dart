import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Residence_provider.dart';
import '../Provider/chargh_provider.dart';

class paychargh extends StatelessWidget {
  static const route_Name = './paychargh';

  @override
  Widget build(BuildContext context) {
    final residence_data = Provider.of<ResidenceProvider>(context);
    final int chargh_id = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resident List'),
      ),
      body: FutureBuilder<double>(
        future: Provider.of<ProviderChargh>(context).fetchPrice(chargh_id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for data, you can display a loading indicator.
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error, display an error message.
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data has been loaded successfully.
            final double price = snapshot.data ?? 0.0;

            return GridView.builder(
              itemCount: residence_data.residenceList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final resident = residence_data.residenceList[index];
                final String name = resident['name_of_Owner'];
                final int unit = resident['unit'];
                final String id = resident['id'];

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
                          Provider.of<ResidenceProvider>(context, listen: false)
                              .updatedebt(id, price);
                        },
                        child: Text('Pay'),
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
