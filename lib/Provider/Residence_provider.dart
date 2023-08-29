import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/ResidenceModel.dart';

class ResidenceProvider extends ChangeNotifier {
  var url = Uri.https(
      'build-mate-default-rtdb.europe-west1.firebasedatabase.app',
      '/residence.json');
  Future<void> addResidence(ResidenceModel residence) async {
    try {
      final response = await http.post(url,
          body: json.encode({
            'block': residence.block,
            'unit': residence.unit,
            'phone_number': residence.phone,
            'floor': residence.floor,
            'name_of_Owner': residence.name,
            'number_of_parking': residence.parking,
          }));
      final newResidence = ResidenceModel(
          name: residence.name,
          block: residence.block,
          floor: residence.floor,
          parking: residence.parking,
          unit: residence.unit,
          phone: residence.phone,
          id: json.decode(response.body)['name']);
      _residenceList.add(newResidence);
    } catch (error) {
      print(error.toString());
    }
    notifyListeners();
  }

  List<ResidenceModel> _residenceList = [];

  List<ResidenceModel> get residenceList {
    return [..._residenceList];
  }

  Future<void> fetchResidences() async {
    try {
      final response = await http.get(
        url,
      );
      final extractData = json.decode(response.body) as Map<String, dynamic>;
      List<dynamic> loadData = [];
      extractData.forEach(
        (key, value) {
          loadData.add(ResidenceModel(
              id:key,
              name:value['name_of_Owner'],
              block:value['block'],
              floor:value['floor'],
              parking:value['number_of_parking'],
              unit:value['unit'],
              phone:value['phone_number']));
        },
      );
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

  /*  Future<void> removeResidence(String byId) async {
    await supabase.from('residence').delete().match({'id': byId});
    notifyListeners();
  }*/

  Future<void> refresh() {
    fetchResidences();
    return Future.delayed(const Duration(seconds: 2));
  }
/*
  Future<void> updateAllPrices(double newPrice) async {
    try {
      await supabase.from('residence').update({'Debt': newPrice}).eq('Debt', 0);
    } catch (error) {
      print(error.toString());
    }
  } */
}
