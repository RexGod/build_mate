import 'package:flutter/widgets.dart';
import 'package:supabase/supabase.dart';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expier;
  late String _userId;
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');

  Future<void> register(String email, String password) async {
    try {
      final response =
          await supabase.auth.signUp(email: email, password: password);
      print('success registration');
    } catch (error) {
      // Handle other exceptions
      print('Error during registration: $error');
    }
  }
}
