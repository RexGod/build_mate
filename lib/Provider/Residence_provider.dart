import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

class ResidenceModel extends ChangeNotifier {
  final String id;
  final String name;
  final String unit;
  final String floor;
  final String block;
  final int parking_numbers;
  final String phone;
  final String? debt;
  final String? request;

  ResidenceModel({
    required this.id,
    required this.name,
    required this.unit,
    required this.floor,
    required this.block,
    required this.parking_numbers,
    required this.phone,
    this.debt,
    this.request,
  });
}

class ResidenceProvider extends ChangeNotifier {
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');

  List<ResidenceModel> get residenceList => [..._residenceList];
  List<ResidenceModel> _residenceList = [];

  Future<void> addResidence(ResidenceModel residence) async {
    await supabase.from('residence').insert({
      'id': residence.id,
      'block': residence.block,
      'unit': residence.unit,
      'phone_number': residence.phone,
      'floor': residence.floor,
      'name': residence.name,
      'number_of_parking': residence.parking_numbers
    }).then((value) {
      final newresidence = ResidenceModel(
          id: residence.id,
          name: residence.name,
          unit: residence.unit,
          floor: residence.floor,
          block: residence.block,
          parking_numbers: residence.parking_numbers,
          phone: residence.phone);
      residenceList.add(newresidence);
      notifyListeners();
    });
  }
}
