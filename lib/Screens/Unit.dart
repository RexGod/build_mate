// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import '../Widgets/Residence.dart';
import '../Widgets/ResidenceForm.dart';
import 'package:provider/provider.dart';
import '../Provider/Residence_provider.dart';

class Unit extends StatefulWidget {
  const Unit({Key? key}) : super(key: key);

  @override
  State<Unit> createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  @override
  void initState() {
    super.initState();
    Provider.of<ResidenceProvider>(context, listen: false).fetchResidences();
  }

  @override
  Widget build(BuildContext context) {
    final residenceData = Provider.of<ResidenceProvider>(context);
    final List<ResidenceModel> residences = residenceData.residencegp;
    //Provider.of<ResidenceProvider>(context).fetchResidences();
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
            residences.length == 0
                ? Container(
                    margin: const EdgeInsets.only(top: 250),
                    child: const Center(
                      child: Text('ساکنی افزوده نشده'),
                    ),
                  )
                : Flexible(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView.builder(
                          itemCount: residences.length,
                          itemBuilder: (context, index) => ResidenceList(
                                id: residences[index].id,
                                name: residenceData.residencegp[index].name,
                                floor: residenceData.residencegp[index].floor,
                                block: residenceData.residencegp[index].block,
                                unit: residenceData.residencegp[index].unit,
                              )),
                    ),
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
