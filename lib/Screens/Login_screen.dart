import 'package:flutter/material.dart';
import '../Widgets/PhoneFormField.dart';

class Login extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  static const route_name = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const SizedBox(
                      width: 100,
                    ),
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        'lib/assets/Logo.png',
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    'lib/assets/Login.png',
                    height: 300,
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  /* key: _formKey, */
                  child: Column(
                    children: [
                      // Other form fields can be added here
                      PhoneNumberFormField(),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: 250,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromRGBO(64, 123, 255, 1),
                        ),
                        child: TextButton(
                          onPressed: () {
                            //Navigator.pushNamed(context, );
                          },
                          child: const Text(
                            'وارد شوید',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
