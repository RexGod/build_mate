import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Register_screen.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});
  static const route_name = '/landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  'lib/assets/Logo.png',
                  height: 80,
                  width: 80,
                ),
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'lib/assets/landing_illu.png',
                  height: 300,
                  width: 300,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 35,
                margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Text(
                  'برای شروع لطفا وارد حساب خود شوید /حساب خود را ایجاد کنید',
                  style: TextStyle(
                      color: Color.fromRGBO(63, 129, 255, 1), fontSize: 11),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                width: 250,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromRGBO(64, 123, 255, 1),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Register.route_name);
                  },
                  child: const Text(
                    'شروع کنید',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
