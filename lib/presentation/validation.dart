

class ValidationClass {

  String validationEmail(String value) {
    if (value == null || value.isEmpty) {
      return 'Required field';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Invalid Email';

    return null;
  }

  String validationPassword(String value) {
    if (value == null || value.isEmpty) {
      return 'Required field';
    }
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return '''Password must be at least 8 characters long, 
            including uppercase, lowercase and number''';

    return null;
  }
}