import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Settings/Validator.dart';
import '../../Settings/Validator.dart';
import '../../Provider/Auth_managers.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static const route_name = '/signup';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
    'name': ''
  };

  final GlobalKey<FormState> _formKey = GlobalKey();
  Color setbackgroundColor = const Color.fromRGBO(242, 242, 242, 1);
  Color buttonColor = const Color.fromRGBO(64, 123, 255, 1);
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    final isemailExist = Provider.of<Auth>(context, listen: false)
        .isEmailInList(_authData['email']!);
    if (await isemailExist) {
      //Navigator.pushReplacementNamed(context, Building.route_name);
    } else {
      Provider.of<Auth>(context, listen: false).register(
          _authData['email']!, _authData['password']!, _authData['name']!);
    }

    /* _emailcontroller.clear();
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
          body: Stack(children: [
            SingleChildScrollView(
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
                    height: 280,
                    width: 280,
                    child: Image.asset(
                      'lib/assets/Login.png',
                      height: 280,
                      width: 280,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Other form fields can be added here
                        Container(
                          width: 300,
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _namecontroller,
                                  keyboardType: TextInputType.visiblePassword,
                                  onEditingComplete: _submit,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    labelText: 'نام',
                                  ),
                                  onSaved: (value) {
                                    _authData['name'] = value!;
                                  },
                                  onChanged: (value) {
                                    // Phone number formatting logic goes here (if needed)
                                    // For example, you can format the phone number as the user types it
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _emailcontroller,
                                  onEditingComplete: _submit,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside),
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
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside),
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
                            onPressed: () {
                              _submit();
                              FocusScope.of(context).unfocus();
                              //Navigator.pushNamed(context, Building.route_name);
                            },
                            child: const Text(
                              'ثبت نام',
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
                                    context, Login.route_name);
                              },
                            ),
                            const Text('اکانت دارید ؟ '),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
