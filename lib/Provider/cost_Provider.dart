import 'package:build_mate/Model/costModel.dart';

import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

import 'package:supabase/supabase.dart';
import 'package:intl/intl.dart';

class ProviderCost with ChangeNotifier {
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');

  // ignore: non_constant_identifier_names
  Future<void> InsertCost(CostModel costModel) async {
    costModel.date = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(costModel.date);
    String dayOfWeek = DateFormat('EEEE').format(costModel.date);
    try {
      await supabase.from('payment').insert({
        'type': costModel.type,
        'price': costModel.price,
        'date': formattedDate,
        'day': dayOfWeek,
        'remainingPrice': costModel.price
        /* 'id': id */
      });
      // ignore: empty_catches
    } catch (error) {
      print(error.toString());
    }
    notifyListeners();
  }

  List<dynamic> _costItems = [];

  Future<void> fetchCostItem() async {
    try {
      final response = await supabase
          .from('payment')
          .select('''id , price, day, date, status, type , remainingPrice''');
      _costItems = response;
    } catch (error) {
      print(error.toString());
    }

    notifyListeners();
  }

  List<dynamic> get costItems => _costItems;

  int total() {
    int totalCost = 0;
    for (var item in _costItems) {
      int price = item['price'];
      totalCost += price;
    }
    return totalCost;
  }

  int totalRemainingPrice() {
    int totalCost = 0;
    for (var item in _costItems) {
      int price = item['remainingPrice'];
      totalCost += price;
    }
    return totalCost;
  }

  Future<void> deleteCostItem(int id) async {
    try {
      await supabase.from('payment').delete().eq('id', id);
      // ignore: empty_catches
    } catch (error) {
      print(error.toString());
    }
  }

  String format1(Date d) {
    final f = d.formatter;

    return '${f.d} ${f.mN} ${f.yyyy}';
  }

  String format2(Date d) {
    final f = d.formatter;

    return f.wN;
  }

  Future<void> updateStatus(int id, bool status) async {
    await supabase.from('payment').update({'status': true}).match({'id': id});
  }

  Future<void> updateprice(int id, double price, double remainingPrice) async {
    remainingPrice = remainingPrice - price;
    await supabase
        .from('payment')
        .update({'remainingPrice': remainingPrice}).match({'id': id});
  }

  String formatCurrencyRial(int amount) {
    final NumberFormat numberFormat = NumberFormat.currency(
      locale: 'fa_IR',
      symbol: '',
      decimalDigits: 0,
    );
    return numberFormat.format(amount);
  }

  Future<void> refresh() {
    fetchCostItem();
    return Future.delayed(const Duration(seconds: 2));
  }
}
