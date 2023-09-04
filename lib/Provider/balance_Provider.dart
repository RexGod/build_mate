import 'package:build_mate/Model/balanceModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:supabase/supabase.dart';

class ProviderBalance with ChangeNotifier {
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');

  Future<void> addBalancecost(balanceModel balance) async {
    balance.date = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(balance.date);
    try {
      await supabase.from('balance').insert({
        'id': balance.id,
        'type': balance.type,
        'price': balance.price,
        'date': formattedDate,
        'name': balance.name
      });
    } catch (error) {
      print(error.toString());
    }
  }

  double calculateBalanceRemaining() {
  double balance = 0;

  for (var item in _balanceItem) {
    double price = (item['price'] as int).toDouble();
    String type = item['type'] as String;

    if (type == 'recive') {
      balance -= price;
    } else if (type == 'sent') {
      balance += price;
    }
  }
  
  return balance;
}


  List<dynamic> _balanceItem = [];

  Future<void> fetchBalanceItem() async {
    try {
      final response = await supabase
          .from('balance')
          .select('''price , date , type , name''');
      _balanceItem = response;
    } catch (error) {
      print(error.toString());
    }

    notifyListeners();
  }

  List<dynamic> get balanceItem => _balanceItem;

  int totalBalance() {
    int totalprice = 0;
    for (var item in _balanceItem) {
      int price = item['price'];
      totalprice += price;
    }
    return totalprice;
  }

  Future<void> refresh() {
    fetchBalanceItem();
    return Future.delayed(const Duration(seconds: 2));
  }

  String format1(Date d) {
    final f = d.formatter;
    return '${f.d} ${f.mN} ${f.yyyy}';
  }
}
