import 'package:flutter/material.dart';
import '../Provider/Auth_managers.dart';
import '../Widgets/Authenticate.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  // ignore: constant_identifier_names
  static const route_name = '/Register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {'email': '', 'password': ''};
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    Provider.of<Auth>(context, listen: false)
        .register(_authData['email']!, _authData['password']!);
  }

  bool isVisible = false;
  Color setbackgroundColor = const Color.fromRGBO(242, 242, 242, 1);
  Color buttonColor = const Color.fromRGBO(64, 123, 255, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            isVisible = false;
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
                          color: Color(Color.getAlphaFromOpacity(0.5)),
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
                        Container(
                          width: 300,
                          child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailcontroller,
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
                                    validator: (value) {
                                      // Phone number validation logic goes here
                                      if (value == null || value.isEmpty) {
                                        return 'لطفا ایمیل خود را وارد نمایید';
                                      }
                                      // You can add more specific validation rules if needed
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _authData['email'] = value!;
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
                                    controller: _passwordcontroller,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              strokeAlign: BorderSide
                                                  .strokeAlignOutside),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      labelText: 'رمز عبور',
                                    ),
                                    validator: (value) {
                                      // Phone number validation logic goes here
                                      if (value == null || value.isEmpty) {
                                        return 'لطفا رمز عبور خود را وارد نمایید';
                                      }
                                      // You can add more specific validation rules if needed
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _authData['password'] = value!;
                                    },
                                    onChanged: (value) {
                                      // Phone number formatting logic goes here (if needed)
                                      // For example, you can format the phone number as the user types it
                                    },
                                  ),
                                ],
                              )),
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
                              setState(() {
                                isVisible = true;
                                setbackgroundColor =
                                    const Color.fromRGBO(242, 242, 242, 0.6);
                                buttonColor =
                                    const Color.fromRGBO(64, 124, 255, 0.6);
                              });

                              //Provider.of<Auth>(context , listen: false).register();
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
            Visibility(
              visible: isVisible,
              child: Container(
                child: Authenticate(),
                alignment: Alignment.center,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
