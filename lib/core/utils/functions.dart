class AuthAppFunctions {
  String? isEmptyNull(String? value) {
    if (value == null || value.isEmpty) {
      return "Required";
    }
    return null;
  }

  String? isNum(String? value) {
    if ((value == null || value.isEmpty)) {
      return "Required";
    }
    final int? age = int.tryParse(value);
    if (age == null) {
      return "Enter number";
    }
    if (age <= 10 || age > 70) {
      return "Enter Correct age";
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

  String? validateNationalID(String? value) {
    // 1. التحقق من الفراغ
    if (value == null || value.isEmpty) {
      return "Please enter National ID";
    }

    // 2. التحقق من أن المدخلات أرقام فقط
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "National ID must contain digits only";
    }

    // 3. التحقق من الطول (14 رقم)
    if (value.length != 14) {
      return "National ID must be exactly 14 digits";
    }

    // 4. التحقق من الرقم الأول (القرن)
    // 2 = مواليد 1900 - 1999
    // 3 = مواليد 2000 - 2099
    String firstDigit = value.substring(0, 1);
    if (firstDigit != '2' && firstDigit != '3') {
      return "Invalid National ID (Start with 2 or 3)";
    }

    // 5. التحقق من منطقية تاريخ الميلاد (اختياري لزيادة الدقة)
    // استخراج الأرقام الخاصة بالتاريخ
    String yearStr = value.substring(1, 3);
    String monthStr = value.substring(3, 5);
    String dayStr = value.substring(5, 7);

    int year = int.parse(yearStr);
    int month = int.parse(monthStr);
    int day = int.parse(dayStr);

    // حساب السنة الكاملة
    int fullYear = (firstDigit == '2') ? (1900 + year) : (2000 + year);

    // التحقق من نطاق الشهر
    if (month < 1 || month > 12) {
      return "Invalid month in National ID";
    }

    // التحقق من نطاق اليوم (بشكل بسيط)
    if (day < 1 || day > 31) {
      return "Invalid day in National ID";
    }

    // التحقق من أن التاريخ ليس في المستقبل
    DateTime birthDate = DateTime(fullYear, month, day);
    if (birthDate.isAfter(DateTime.now())) {
      return "Birth date cannot be in the future";
    }

    // 6. التحقق من كود المحافظة (من 01 لـ 35 أو 88 للمولودين بالخارج)
    String govCode = value.substring(7, 9);
    int govInt = int.parse(govCode);
    if ((govInt < 1 || govInt > 35) && govInt != 88) {
      return "Invalid Governorate Code";
    }

    return null; // ✅ الرقم صحيح
  }
}
