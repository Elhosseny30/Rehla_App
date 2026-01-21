import 'package:bloc/bloc.dart';
import 'package:graduationproject/features/auth/presentation/cubit/patientRegister/patient_register_state.dart';

class PatientRegisterStateCubit extends Cubit<PatientRegisterState> {
  PatientRegisterStateCubit() : super(PatientRegisterState());

  void selectRole(int role) {
    emit(state.copyWith(userRole: role));
  }

  void updateBasicInfo({
    String? fName,
    String? lName,
    String? uName,
    String? phone,
    String? email,
  }) {
    emit(
      state.copyWith(
        firstName: fName,
        lastName: lName,
        username: uName,
        phoneNumber: phone,
        email: email,
      ),
    );
  }

  void updateMedicalInfo({
    String? dob,
    String? height,
    String? weight,
    String? illnessStage,
    String? journeyStage,
    String? concern,
  }) {
    emit(
      state.copyWith(
        birthDate: dob,
        height: height,
        weight: weight,
        illnessStage: illnessStage,
        journeyStage: journeyStage,
        currentConcern: concern,
      ),
    );
  }

  void updateLifestyleInfo({String? role, String? hobby, String? interest}) {
    emit(state.copyWith(dailyRole: role, hobby: hobby, interest: interest));
  }

  void updatePasswordValues(String password, String confirmedPassword) {
    int score = 0;
    bool tempIsMiniEightOrSpecialChar = false;
    bool tempIsLowerUpperChars = false;
    bool tempIsOneNumber = false;
    bool tempIsIsMatched = false;

    bool hasSpecial = RegExp(r'[!@#$%^&*(),.?":{}<>]').hasMatch(password);
    if (password.length >= 8 && hasSpecial) {
      tempIsMiniEightOrSpecialChar = true;
      score++;
    }
    if (password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]'))) {
      tempIsLowerUpperChars = true;
      score++;
    }

    if (password.contains(RegExp(r'[0-9]'))) {
      tempIsOneNumber = true;
      score++;
    }

    if ((password.isNotEmpty && confirmedPassword.isNotEmpty) &&
        (password == confirmedPassword)) {
      tempIsIsMatched = true;
      score++;
    }
    emit(state.copyWith(
      isMiniEightOrSpecialChar: tempIsMiniEightOrSpecialChar,
      lowerUpperChars: tempIsLowerUpperChars,
      oneNumber: tempIsOneNumber,
      isMatched: tempIsIsMatched,
      passwordStrength: score / 4.0,
    ));
    
  }

  Future<void> submitRegister({required String password}) async {
    // 1. تحديث الباسورد في الـ State
    emit(state.copyWith(password: password, isLoading: true));

    try {
      // 2. تجميع كل البيانات عشان نبعتها للـ API
      final registrationData = {
        "role": state.userRole,
        "first_name": state.firstName,
        "last_name": state.lastName,
        "email": state.email,
        "phone": state.phoneNumber,
        "medical_info": {
          "weight": state.weight,
          "height": state.height,
          "stage": state.illnessStage,
        },
        "lifestyle": {"hobby": state.hobby},
        "password": password,
      };

      print("Sending to API: $registrationData");

      // محاكاة لطلب الـ API (استبدلها بالـ Repo بتاعك)
      await Future.delayed(const Duration(seconds: 2));

      // نجاح
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      // فشل
      emit(
        state.copyWith(isLoading: false, errorMessage: "Registration Failed"),
      );
    }
  }
}
