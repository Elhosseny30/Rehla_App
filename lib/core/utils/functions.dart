import 'package:dio/dio.dart';

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

    return null;
  }

  String handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Connection Time is end..check your internet";

      case DioExceptionType.badResponse:
        // هنا بنشوف الـ Status Code اللي راجع من الباك إند
        final statusCode = e.response?.statusCode;

        if (statusCode == 400) {
          return "Bad Request";
        } else if (statusCode == 401) {
          return "Unauthorized)";
        } else if (statusCode == 403) {
          return "Forbidden";
        } else if (statusCode == 404) {
          return "Not Found";
        } else if (statusCode == 500) {
          return "Server Error)";
        }
        return "Error in Server: $statusCode";

      case DioExceptionType.cancel:
        return "Request is canceled";

      case DioExceptionType.connectionError:
        return "There is no internet";

      case DioExceptionType.unknown:
      default:
        return "unexcpected error";
    }
  }

  String getActionTextActivityCommunity(String type) {
    switch (type) {
      case 'LIKE_POST':
        return 'Liked Your Post';
      case 'LIKED_COMMENT':
        return 'Liked Your Comment';
      case 'FOLLOW':
        return 'Started Following You';
      case 'SUGGEST_GROUP':
        return 'Suggested Group';
      case 'CONVERSATION':
        return 'Sent you a message';
      case 'MENTION':
        return 'Mentioned you in a comment';
      case 'SUGGEST_PERSON':
        return 'Suggested for you';
      default:
        return 'Did something';
    }
  }

  String getTimeAgoActivityModel(DateTime time) {
    final difference = DateTime.now().difference(time);
    if (difference.inMinutes > 0 && difference.inMinutes < 60) {
      return '${difference.inMinutes} Minutes ago';
    } else if (difference.inHours > 0 && difference.inHours < 24) {
      return '${difference.inHours} Hours ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} Days ago';
    }
    return 'Just now';
  }

  //final String token = "";
}
