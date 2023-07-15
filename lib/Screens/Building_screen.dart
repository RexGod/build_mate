import 'package:flutter/material.dart';

import '../Widgets/Residence.dart';

class Building extends StatelessWidget {
  Building({super.key});
  static const route_name = '/building_screen';

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
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(64, 123, 255, 1),
          items: [
            BottomNavigationBarItem(
                label: 'Text',
                icon: Icon(
                  Icons.add_alarm,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(label: 'Text', icon: Icon(Icons.add_alarm))
          ]),
    );
  }
}
