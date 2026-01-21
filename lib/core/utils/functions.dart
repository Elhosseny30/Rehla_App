class AuthAppFunctions {
  String? isEmptyNull(String? value) {
    if (value == null || value.isEmpty) {
      return "Required";
    }
    return null;
  }

  String? emailChecker(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
