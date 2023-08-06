import 'package:flutter/foundation.dart';

import 'package:supabase/supabase.dart';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expier;
  
  late String _password;
  late String _status;
  late String _userId;
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');

  Future<void> register(String email, String password, String name) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      //_password = password;
      _userId = response.user!.id;

      await supabase.from('Users').insert(
          {'id': _userId, 'email': email, 'password': password, 'name': name});
      print('success registration');
    } catch (error) {
      if ('Connection reset by peer' == error.toString()) {
        await supabase.auth.signUp(
          email: email,
          password: password,
        );
      }
      // Handle other exceptions
      print('Error during registration: $error');
    }
  }

  /* Future<bool> isPasswordCorrect(String password) async {
    final data = await supabase.from('Users').select('password');
    final List<dynamic> user = data;
    return user.any((user) => user['password'] == password);
  }
 */
  Future<bool> isEmailInList(String email) async {
    final data = await supabase.from('Users').select('email');
    final List<dynamic> user = data;
    return user.any((user) => user['email'] == email);
  }

  Future<void> login(String email, String password) async {
    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print('login good');
      _status = response.user!.emailConfirmedAt!;
    } catch (e) {
      // Handle other exceptions
      if ('Connection reset by peer' == e.toString()) {
         await supabase.auth.signInWithPassword(
          email: email,
          password: password,
        );
      }

      print('Error during login: $e');
    }
  }
}
