import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class ResidenceModel extends ChangeNotifier {
  String id;
  String name;
  String unit;
  String floor;
  String block;
  String parking_numbers;
  String phone;
  String? debt;
  String? request;

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

  Future<void> addResidence(String name, String block, String unit,
      String phone, String floor, String parking) async {
    try {
      var uuid = Uuid();

      // Generate a v1 (time-based) id
      var iduuid = uuid.v1();
      var id = iduuid;
      final response = await supabase.from('residence').insert({
        'id': id,
        'block': block,
        'unit': unit,
        'phone_number': phone,
        'floor': floor,
        'name_of_Owner': name,
        'number_of_parking': parking
      }).then((value) {
        print('its ok');
        final newresidence = ResidenceModel(
            id: id,
            name: name,
            unit: unit,
            floor: floor,
            block: block,
            parking_numbers: parking,
            phone: phone);
        residenceList.add(newresidence);
        notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
