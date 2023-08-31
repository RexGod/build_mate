// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import '../../Widgets/ResidenceItems.dart';
import '../../Widgets/ResidenceForm.dart';
import 'package:provider/provider.dart';
import '../../Provider/Residence_provider.dart';

class Unit extends StatefulWidget {
  const Unit({Key? key}) : super(key: key);

  @override
  State<Unit> createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  var _isLoading = true;
  @override
  void initState() {
    super.initState();
    Provider.of<ResidenceProvider>(context, listen: false)
        .fetchResidences()
        .then((_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final format = Provider.of<ResidenceProvider>(context);
    //final residenceData = Provider.of<ResidenceProvider>(context);
    //final List<ResidenceModel> residences = residenceData.residencegp;
    //Provider.of<ResidenceProvider>(context).fetchResidences();
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  /*  residences.length == 0
                ? Container(
                    margin: const EdgeInsets.only(top: 250),
                    child: const Center(
                      child: Text('ساکنی افزوده نشده'),
                    ),
                  )
                : */
                  Flexible(
                    child: Consumer<ResidenceProvider>(
                      builder: (context, providerResicence, _) {
                        final List<dynamic> data =
                            providerResicence.residenceList;
                        if (data.isEmpty) {
                          return const Center(
                            child: Text(
                              'هیچ ساکنی اضافه نشده + لمس کنید',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: format.refresh,
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                ResidenceItems(data[index]),
                            itemCount: data.length,
                          ),
                        );
                      },
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
              // final screenHeight = MediaQuery.of(context).size.height;
              //final height = screenHeight * 0.8;

              return Container(
                // height: height,
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
