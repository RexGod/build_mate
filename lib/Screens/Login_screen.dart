import 'package:flutter/material.dart';
import '../Widgets/PhoneFormField.dart';
import '../Widgets/Authenticate.dart';

class Login extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  // ignore: constant_identifier_names
  static const route_name = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    /* key: _formKey, */
                    child: Column(
                      children: [
                        // Other form fields can be added here
                        PhoneNumberFormField(),
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
                              FocusScope.of(context).unfocus();
                              setState(() {
                                isVisible = true;
                                setbackgroundColor =
                                    const Color.fromRGBO(242, 242, 242, 0.6);
                                buttonColor =
                                    const Color.fromRGBO(64, 124, 255, 0.6);
                              });
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
