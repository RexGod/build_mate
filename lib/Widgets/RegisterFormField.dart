/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Auth_managers.dart';

class RegisterFormField extends StatefulWidget  with ChangeNotifier{
  @override
  _RegisterFormFieldState createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  final TextEditingController _phonecontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {'phone': ''};
  var _isLoading = false;
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    // Sign user up
    await Provider.of<Auth>(context, listen: false)
        .register(_authData['phone']!);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _phonecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Column(
            children: [
              TextFormField(
                controller: _phonecontroller,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          strokeAlign: BorderSide.strokeAlignOutside),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  labelText: 'شماره تلفن',
                ),
                validator: (value) {
                  // Phone number validation logic goes here
                  if (value == null || value.isEmpty) {
                    return 'لطفا شماره تلفن خود را وارد نمایید';
                  }
                  // You can add more specific validation rules if needed
                  return null;
                },
                onSaved: (value) {
                  _authData['phone'] = value!;
                },
                onChanged: (value) {
                  // Phone number formatting logic goes here (if needed)
                  // For example, you can format the phone number as the user types it
                },
              ),
            ],
          )),
    );
  }
}
 */