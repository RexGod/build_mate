import 'package:build_mate/Model/charghModel.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:supabase/supabase.dart';

class ProviderChargh with ChangeNotifier {
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');
  Future<int> insertChargh(charghModel chargh) async {
    try {
      final response = await supabase.from('chargh').insert({
        'name': chargh.name,
        'deadLinetime': chargh.deadLine.toUtc().toIso8601String(),
      }).select('id');
      if (response != null) {
        return response[0]['id'] as int;
      }
    } catch (error) {
      print(error.toString());
    }
    return -1; // Return a default value or handle errors appropriately
  }

  Future<void> insertPrice(int id, double price) async {
    await supabase.from('chargh').update({'price': price}).match({'id': id});
  }

  List<dynamic> _charghItems = [];
  Future<void> fetchChargh() async {
    try {
      final data = await supabase
          .from('chargh')
          .select('''id , name , deadLinetime , price''');
      _charghItems = data;
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  List<dynamic> get charghItems => _charghItems;

  Future<void> refresh() {
    fetchChargh();
    return Future.delayed(const Duration(seconds: 2));
  }

  String format1(Date d) {
    final f = d.formatter;

    return '${f.d} ${f.mN} ${f.yyyy}';
  }
}
