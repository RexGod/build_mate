import 'package:build_mate/Model/balance_cashModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase/supabase.dart';

class ProviderBalance with ChangeNotifier {
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');

  Future<void> addBalance(balanceModel balance) async {
    balance.date = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(balance.date);
    try {
      await supabase.from('balance').insert({
        'type': balance.type,
        'price': balance.price,
        'date': formattedDate
      });
    } catch (error) {
      print(error.toString());
    }
  }

  List<dynamic> _balancePrice = [];

  Future<void> fetchCostItem() async {
    try {
      final response = await supabase.from('balance').select('''price''');
      _balancePrice = response;
    } catch (error) {
      print(error.toString());
    }

    notifyListeners();
  }

  List<dynamic> get costItems => _balancePrice;
  int totalBalance() {
    int totalprice = 0;
    for (var item in _balancePrice) {
      int price = item['price'];
      totalprice += price;
    }
    return totalprice;
  }
}
