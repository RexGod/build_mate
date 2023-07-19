import 'package:flutter/material.dart';
import '../Widgets/Residence.dart';
import '../Widgets/ResidenceForm.dart';

class Unit extends StatelessWidget {
  const Unit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  width: 100,
                ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    'lib/assets/Logo.png',
                    height: 80,
                    width: 80,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ResidenceList(),
            ),
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
                child: const SingleChildScrollView(
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
