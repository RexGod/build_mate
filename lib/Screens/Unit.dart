import 'package:flutter/material.dart';
import '../Widgets/Residence.dart';
import '../Widgets/ResidenceForm.dart';

class Unit extends StatelessWidget {
  const Unit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back)),
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
          SizedBox(
            height: 30,
          ),
          Expanded(child: ResidenceList()),

          //BottomNavigationBar(items: )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              //shape: Border(left: BorderSide(width: 5)),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              context: context,
              builder: (BuildContext context) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    margin: EdgeInsets.all(15),
                    child: ResidenceForm());
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
