class ErrorResponseModel {
  final String errorMessage;

  ErrorResponseModel({required this.errorMessage});

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    String allErrors = '';

    // 1. فحص الرسالة المباشرة (Simple Message)
    if (json['message'] != null && json['message'] is String) {
      return ErrorResponseModel(errorMessage: json['message']);
    }

    // 2. فحص أخطاء التحقق القياسية (Standard Validation Errors)
    if (json['errors'] != null && json['errors'] is Map) {
      (json['errors'] as Map).forEach((key, value) {
        if (value is List) {
          // دمج قائمة الأخطاء لكل حقل
          allErrors += "${value.join('\n')}\n";
        } else {
          allErrors += "$value\n";
        }
      });
      
      if (allErrors.isNotEmpty) {
         return ErrorResponseModel(errorMessage: allErrors.trim());
      }
    }

    // 3. فحص الحالات الغريبة (Fallback Loop)
    // بيلف على الـ JSON كله عشان يلقط أي List تايهة زي الحالة بتاعت ""
    json.forEach((key, value) {
      // بنتجاهل المفاتيح الإدارية واللي فحصناها قبل كدا
      if (key != 'status' && key != 'title' && key != 'traceId' && key != 'type' && key != 'errors' && key != 'message') {
        if (value is List) {
          allErrors += "${value.join('\n')}\n";
        } else if (value is String) {
          allErrors += "$value\n";
        }
      }
    });

    if (allErrors.isNotEmpty) {
      return ErrorResponseModel(errorMessage: allErrors.trim());
    }
    
    // 4. لو مفيش غير عنوان الخطأ العام
    if (json['title'] != null) {
      return ErrorResponseModel(errorMessage: json['title']);
    }

    // 5. لو فشلنا تماماً في قراءة الخطأ
    return ErrorResponseModel(errorMessage: "Unknown error occurred");
  }
}