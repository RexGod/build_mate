// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:supabase/supabase.dart';

class Auth with ChangeNotifier {
  late String _password;
  SupabaseClient supabase = SupabaseClient(
      'https://vzlhnipbllxwusreekcb.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ6bGhuaXBibGx4d3VzcmVla2NiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMzY5NTYsImV4cCI6MTk5NzkxMjk1Nn0.Sn9FWq3SB_wwV76niREsmrL9bBDzEsEPusVW-9TG3So');

  Future<void> register(String email, String password, String name) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      _password = password;
      if (res.user != null) {
        final userId = res.user!.id;
        await supabase.from('Users').insert(
          {'id': userId, 'email': email, 'name': name, 'password': password},
        );
      }
    } catch (error) {
      if ('Connection reset by peer' == error.toString()) {
        await supabase.auth.signUp(
          email: email,
          password: password,
        );
      }
    }
  }

  Future<bool> isPasswordCorrected(String email, String password) async {
    final data = await supabase.from('Users').select('email , password');
    final List<dynamic> user = data;
    return user
        .any((user) => user['email'] == email && user['password'] == password);
  }

  Future<void> isEmailConfrimed(String email, String password) async {
    final data =
        await supabase.from('Users').select('password').eq('email', email);
    if (data != null) {
      await supabase
          .from('Users')
          .update({'password': password}).match({'email': email});
    }
  }

  Future<void> logOut() async {
    await supabase.auth.signOut();
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      final isPasswordCorrect = await isPasswordCorrected(email, password);
      if (isPasswordCorrect) {
        final AuthResponse res = await supabase.auth.signInWithPassword(
          email: email,
          password: password,
        );
        if (res.user!.emailConfirmedAt != null) {
          await isEmailConfrimed(email, _password);
        }
        final User? user = res.user;
        if (user != null) {
          print('Login successful');
        } else {
          print('Supabase login failed');
          // Show a Snackbar when login fails
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('لطفا ابتدا ایمیل خود را تایید کتید'),
            ),
          );
        }
      } else {
        print('Incorrect password');
        // Show a Snackbar when login fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('رمز اشتباه است دوباره تلاش کنید'),
          ),
        );
      }
    } catch (e) {
      print('An error occurred during login: $e');
      // Show a Snackbar for other login errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطایی رخ داد دوباره تلاش کنید'),
        ),
      );
    }
  }
}
