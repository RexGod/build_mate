import 'package:flutter/material.dart';

class ResidenceProvide extends ChangeNotifier {
  late String? name;
  final int? unit;
  final String? floor;
  final String? block;
  final int? parking_numbers;
  final String? phone;
  final String? debt;
  final String? request;

  ResidenceProvide({
    this.name,
    this.unit,
    this.floor,
    this.block,
    this.parking_numbers,
    this.phone,
    this.debt,
    this.request,
  });

  List<Map<String, dynamic>> get residenceList => [..._residenceList];
  List<Map<String, dynamic>> _residenceList = [
    {'unit': 1, 'floor': 'first', 'block': 'A', 'parking_numbers': 1},
    {'unit': 12, 'floor': 'fourth', 'block': 'A', 'parking_numbers': 2}
  ];
}
