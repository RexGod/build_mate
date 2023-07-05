// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/foundation.dart';
List <Manager> _managers = [];
List<Manager> get managers => _managers;

class Manager extends ChangeNotifier {
  final String id;
  final String name;
  final int phone_number;
  final String date;

  Manager({
    required this.id,
    required this.name,
    required this.phone_number,
    required this.date,
  });
  
}


