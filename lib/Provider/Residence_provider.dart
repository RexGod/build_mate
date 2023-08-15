import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:uuid/uuid.dart';

import '../Model/ResidenceModel.dart';

class ResidenceProvider extends ChangeNotifier {
  late String _status = '';
  String get status => _status;
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');

  Future<void> addResidence(ResidenceModel residence) async {
    _status = '';
    notifyListeners();
    try {
      var uuid = const Uuid();

      var id = uuid.v1();

      final response = await supabase.from('residence').insert({
        'id': id,
        'block': residence.block,
        'unit': residence.unit,
        'phone_number': residence.phone,
        'floor': residence.floor,
        'name_of_Owner': residence.name,
        'number_of_parking': residence.parking,
      }).select();
      if (response.isNotEmpty) {
        _status = 'ok';
        notifyListeners();
      } else {
        print('error accured');
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  List<dynamic> _residenceList = [];

  Future<void> fetchResidences() async {
    try {
      final response = await supabase.from('residence').select(
          '''name_of_Owner , block , unit , phone_number , number_of_parking , floor , id , Debt''');
      _residenceList = response;

      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

  List<dynamic> get residenceList => _residenceList;

  Future<void> removeResidence(String byId) async {
    await supabase.from('residence').delete().match({'id': byId});
    notifyListeners();
  }

  Future<void> refresh() {
    fetchResidences();
    return Future.delayed(const Duration(seconds: 2));
  }

  Future<void> updateAllPrices(double newPrice) async {
    try {
      await supabase.from('residence').update({'Debt': newPrice}).eq('Debt', 0);
    } catch (error) {
      print(error.toString());
    }
  }
}
