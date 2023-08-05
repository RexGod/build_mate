import 'package:build_mate/Model/costModel.dart';
import 'package:flutter/material.dart';
//
import 'package:supabase/supabase.dart';
import 'package:intl/intl.dart';

class ProviderCost with ChangeNotifier {
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');
  Future<void> InsertCost(
      /* String type, DateTime date, String price */ CostModel
          costModel) async {
    costModel.date = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(costModel.date);
    String dayOfWeek = DateFormat('EEEE').format(costModel.date);
    try {
      await supabase.from('payment').insert({
        'type': costModel.type,
        'price': costModel.price,
        'date': formattedDate,
        'day': dayOfWeek,
      });
    } catch (error) {
      print(error.toString());
    }
    notifyListeners();
  }

  List<dynamic> _costItems = [];

  Future<void> fetchCostItem() async {
    final response = await supabase
        .from('payment')
        .select('''price, day, date, status, type''');
    _costItems = response;
    notifyListeners();
  }

  List<dynamic> get costItems => _costItems;
}
