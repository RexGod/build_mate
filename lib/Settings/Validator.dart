import 'package:flutter/foundation.dart';

class Setting with ChangeNotifier {
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'رمز عبور خود را وارد نمایید';
    }
    if (value.length < 8) {
      return 'حداقل 8 کارکتر باشد';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'حداقل شامل یک حرف بزرگ باشد';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'حداقل شامل یک حرف کوچک باشد';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'شامل یک عدد حداقل باشد';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'حداقل شامل یک کارکتر خاص باشد';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا ایمیل خود را وارد نمایید';
    }

    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'لطفا ایمیل معتبر وارد کنید';
    }

    return null;
  }

  String? validphoneNumber(String? value) {
    if (value == null) {
      return 'لطفا شماره را وارد نمایید';
    }

    const iranPhoneRegex = r'^09[0-9]{9}$|^0[1-9][0-9]{7}$';
    if (!RegExp(iranPhoneRegex).hasMatch(value)) {
      return 'لطفا شماره معتبری وارد نمایید';
    }
    return null;
  }
}
