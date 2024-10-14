import 'package:flutter_test/flutter_test.dart';

// Importez votre classe EmailValidation et EmailValidationError
import 'package:newsletter/newsletter.dart'; 

void main() {
  group('EmailValidation', () {
    test('valid email address returns valid state', () {
      final email = EmailValidation.dirty('test@example.com');
      expect(email.isValid, true);
      expect(email.error, null);
    });

    test('invalid email address returns invalid state', () {
      final email = EmailValidation.dirty('test');
      expect(email.isValid, false);
      expect(email.error, EmailValidationError.invalid);
    });

    test('empty email address returns invalid state', () {
      final email = EmailValidation.dirty('');
      expect(email.isValid, false);
      expect(email.error, EmailValidationError.empty);
    });

    test('null email address returns invalid state', () {
      final email = EmailValidation.dirty();
      expect(email.isValid, false);
      expect(email.error, EmailValidationError.empty);
    });

    test('email with only domain returns invalid state', () {
      final email = EmailValidation.dirty('@example.com');
      expect(email.isValid, false);
      expect(email.error, EmailValidationError.invalid);
    });

    test('email with only username returns invalid state', () {
      final email = EmailValidation.dirty('test@');
      expect(email.isValid, false);
      expect(email.error, EmailValidationError.invalid);
    });

    test('cached error returns correct error', () {
      final email = EmailValidation.dirty('test');
      expect(email.error, EmailValidationError.invalid);
      final pureEmail = email.clean(); // Change the value to pure
      expect(pureEmail.error, EmailValidationError.empty); // Expect the same error
    });
  });
}