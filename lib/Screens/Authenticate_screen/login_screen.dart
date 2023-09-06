// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Settings/Validator.dart';

import '../../Provider/Auth_managers.dart';

import '../Building_screen.dart';
import 'SignUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  // ignore: constant_identifier_names
  static const route_name = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final Map<String, String> _authData = {'email': '', 'password': ''};
  //final user_id = Provider.of<Auth>(context).
  final GlobalKey<FormState> _formKey = GlobalKey();
  Color setbackgroundColor = const Color.fromRGBO(242, 242, 242, 1);
  Color buttonColor = const Color.fromRGBO(64, 123, 255, 1);
  bool isLoading = false;
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    final isemailExist = Provider.of<Auth>(context, listen: false)
        .isPasswordCorrected(_authData['email']!, _authData['password']!);

    if (await isemailExist) {
      setState(() {
        isLoading = true; // Show loading state
      });
      Provider.of<Auth>(context, listen: false)
          .login(_authData['email']!, _authData['password']!, context);
      setState(() {
        isLoading = false; // Hide loading state
      });
      Navigator.of(context).pushReplacementNamed(Building.route_name);
    } else {}

/*     _emailcontroller.clear();
    _passwordcontroller.clear(); */
  }

  @override
  Widget build(BuildContext context) {
    final validpass = Provider.of<Setting>(context).validatePassword;
    final validemail = Provider.of<Setting>(context).validateEmail;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            setbackgroundColor = const Color.fromRGBO(242, 242, 242, 1);
            buttonColor = const Color.fromRGBO(64, 123, 255, 1);
          });
        },
        child: Scaffold(
          backgroundColor: setbackgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
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
                          height: 100,
                          width: 220,
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
                      key: _formKey,
                      child: Column(
                        children: [
                          // Other form fields can be added here
                          SizedBox(
                            width: 300,
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailcontroller,
                                    onEditingComplete: _submit,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              strokeAlign: BorderSide
                                                  .strokeAlignOutside),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      labelText: 'ایمیل',
                                    ),
                                    validator: validemail,
                                    onSaved: (value) {
                                      _authData['email'] = value!;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: _passwordcontroller,
                                    keyboardType: TextInputType.visiblePassword,
                                    onEditingComplete: _submit,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              strokeAlign: BorderSide
                                                  .strokeAlignOutside),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      labelText: 'رمز عبور',
                                    ),
                                    validator: validpass,
                                    onSaved: (value) {
                                      _authData['password'] = value!;
                                    },
                                    onChanged: (value) {
                                      // Phone number formatting logic goes here (if needed)
                                      // For example, you can format the phone number as the user types it
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 250,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: buttonColor,
                            ),
                            child: TextButton(
                              onPressed: () async {
                                try {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await _submit();
                                  FocusScope.of(context).unfocus();
                                } catch (e) {
                                  print(e);
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }

                                //Navigator.pushNamed(context, Building.route_name);

                                //
                              },
                              child: const Text(
                                'وارد شوید',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: const Text('وارد شوید'),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, SignUp.route_name);
                                },
                              ),
                              const Text('اکانت ندارید ؟ '),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
