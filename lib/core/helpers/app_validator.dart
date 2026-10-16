import 'package:doctor_hunt/gen/strings.g.dart';
import 'package:flutter/widgets.dart';

class AppValidators {
  AppValidators._();

  static String? required(
    BuildContext context,
    String? value, {
    String? fieldName,
  }) {
    if (value == null || value.trim().isEmpty) {
      return context.t.fieldRequired(fieldName: fieldName ?? context.t.field);
    }
    return null;
  }

  static String? email(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.t.emailRequired;
    }

    if (!_isValidEmail(value)) {
      return context.t.validEmailRequired;
    }

    return null;
  }

  static bool isValidEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return false;
    }
    return _isValidEmail(value);
  }

  static bool _isValidEmail(String value) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(pattern).hasMatch(value.trim());
  }

  static String? password(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.t.passwordRequired;
    }

    if (value.length < 8) {
      return context.t.passwordMinLength(length: 8);
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return context.t.passwordUppercaseRequired;
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return context.t.passwordLowercaseRequired;
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return context.t.passwordNumberRequired;
    }

    return null;
  }

  static String? confirmPassword(
    BuildContext context,
    String? value,
    String password,
  ) {
    if (value == null || value.isEmpty) {
      return context.t.confirmPasswordRequired;
    }

    if (value != password) {
      return context.t.passwordsDoNotMatch;
    }

    return null;
  }

  static String? phone(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.t.phoneRequired;
    }

    if (!RegExp(r'^\d{11}$').hasMatch(value)) {
      return context.t.validPhoneRequired;
    }

    return null;
  }

  static String? minLength(
    BuildContext context,
    String? value, {
    required int length,
    String? fieldName,
  }) {
    if (value == null || value.trim().isEmpty) {
      return context.t.fieldRequired(fieldName: fieldName ?? context.t.field);
    }

    if (value.trim().length < length) {
      return context.t.fieldMinLength(
        fieldName: fieldName ?? context.t.field,
        length: length,
      );
    }

    return null;
  }

  static String? agreeWithTerms(BuildContext context, bool? value) {
    if (value != true) {
      return context.t.termsAgreementRequired;
    }
    return null;
  }
}
