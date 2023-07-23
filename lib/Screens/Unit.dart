import 'package:flutter/material.dart';
import '../Widgets/Residence.dart';
import '../Widgets/ResidenceForm.dart';
import 'package:provider/provider.dart';
import '../Provider/Residence_provider.dart';

class Unit extends StatelessWidget {
  const Unit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final residenceData = Provider.of<ResidenceProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                'lib/assets/Logo.png',
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: residenceData.residenceList.length,
                  itemBuilder: (context, index) {
                    ResidenceList(
                      id: residenceData.residenceList[index].id,
                      block: residenceData.residenceList[index].block,
                      floor: residenceData.residenceList[index].floor,
                      name: residenceData.residenceList[index].name,
                      unit: residenceData.residenceList[index].unit,
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              final screenHeight = MediaQuery.of(context).size.height;
              final height = screenHeight * 0.8;

              return Container(
                height: height,
                margin: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: ResidenceForm(),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
