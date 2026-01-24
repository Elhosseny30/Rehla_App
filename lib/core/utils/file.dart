import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class IDScannerService {
  
  // 1. دالة تحويل الأرقام العربية (٠١٢) إلى إنجليزية (012)
  static String _convertArabicToEnglish(String input) {
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    for (int i = 0; i < arabic.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    return input;
  }

  // 2. الدالة الرئيسية لاستخراج الرقم القومي
  static Future<String?> extractID(File imageFile) async {
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
      
      // استخراج النص من الصورة
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      await textRecognizer.close();

      // تحويل النص كله لأرقام إنجليزية
      String fullText = _convertArabicToEnglish(recognizedText.text);
      
      // إزالة المسافات لتسهيل البحث
      fullText = fullText.replaceAll(' ', '').replaceAll('\n', '');

      // البحث عن 14 رقم يبدأ بـ 2 أو 3
      RegExp regExp = RegExp(r"\b(2|3)\d{13}\b");
      final match = regExp.firstMatch(fullText);

      return match?.group(0); // يرجع الرقم لو لقاه، أو null
    } catch (e) {
      print("Error scanning ID: $e");
      return null;
    }
  }
}