import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid }

class EmailValidation extends FormzInput<String, EmailValidationError>
    with FormzInputErrorCacheMixin {
  EmailValidation.pure([super.value = '']) : super.pure();
  EmailValidation.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  EmailValidation clean([String value = '']) {
    return EmailValidation.pure(value);
  }

  @override
  EmailValidationError? validator(String? value) {
    if (value?.isEmpty == true) {
      return EmailValidationError.empty;
    } else if (!_emailRegExp.hasMatch(value ?? '')) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}
