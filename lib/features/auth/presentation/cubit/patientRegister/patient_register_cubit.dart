import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:graduationproject/core/utils/DioHelper.dart';
import 'package:graduationproject/core/utils/error.dart';
import 'package:graduationproject/features/auth/data/models/register_response_model.dart';
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
    int?role,
  }) {
    emit(
      state.copyWith(
        firstName: fName,
        lastName: lName,
        username: uName,
        phoneNumber: phone,
        email: email,
        userRole: role,
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
        errorMessage: null, 
        status: RegisterStatus.initial,
      ),
    );
  }

  void updateLifestyleInfo({String? role, String? hobby, String? interest,String ? careOne, String? careTwo}) {
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
      password: password,
      confirmedPassword: confirmedPassword,
      isMiniEightOrSpecialChar: tempIsMiniEightOrSpecialChar,
      lowerUpperChars: tempIsLowerUpperChars,
      oneNumber: tempIsOneNumber,
      isMatched: tempIsIsMatched,
      passwordStrength: score / 4.0,
      errorMessage: null, 
      status: RegisterStatus.initial,
    ));
    
  }

  Future<void> submitRegisterDoctor() async {
    emit(state.copyWith(status: RegisterStatus.loading));

    try {
      final Map<String, dynamic> requestData = {
        "firstName": state.firstName,
        "lastName": state.lastName,
        "username": state.userName,
        "phoneNumber": state.phoneNumber,
        "email": state.email,
        "address": "Egypt",
        "dateOfBirth": "1995-01-23",
        "gender": "Male",

        "password": state.password,
        "confirmPassword": state.confirmedPassword,
        "medicalHistory": state.illnessStage,

      };
      print("Sending data : $requestData");

      final response = await DioHelper.postData(
        url: 'api/Account/Register/Patient',
        data: requestData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        
        emit(state.copyWith(status: RegisterStatus.registerSuccess));
      }
    } on DioException catch (e) {
      String errorMsg = 'Somthing went wrong';
      if (e.response != null && e.response?.data != null) {
        try {
          final errorModel = ErrorResponseModel.fromJson(e.response!.data);
          errorMsg = errorModel.errorMessage;
        } catch (_) {
          errorMsg = e.response?.data.toString() ?? 'Server Error';
        }
      } else {
        errorMsg = "Check your internet connection";
      }
      print("Error: $errorMsg");
      emit(state.copyWith(
      status: RegisterStatus.failure, 
      errorMessage: errorMsg
    ));
    } catch (e) {
      emit(state.copyWith(
      status: RegisterStatus.failure, 
      errorMessage: e.toString()
    ));
    }
  }

   Future<void> verifayEmail({
    required String email,
    required String code,
  }) async {
    emit(state.copyWith(status: RegisterStatus.loading));

    try {
      final response = await DioHelper.postData(
        url: 'api/Account/ConfirmEmail',
        data: {"email": email, "code": code},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(state.copyWith(status: RegisterStatus.verifySuccess));
      }
    } on DioException catch (e) {
      String errorMsg = 'Somthing went wrong';
      if (e.response != null && e.response?.data != null) {
        try {
          final errorModel = ErrorResponseModel.fromJson(e.response!.data);
          errorMsg = errorModel.errorMessage;
        } catch (_) {
          errorMsg = e.response?.data.toString() ?? 'Server Error';
        }
        print("Error: $errorMsg");
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            errorMessage: errorMsg,
          ),
        );
      }else {
        errorMsg = "Check your internet connection";
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            errorMessage: errorMsg,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }


  Future<void> resendVerificationEmail({
    required String email,
  }) async {
    emit(state.copyWith(status: RegisterStatus.loading));

    try {
      final response = await DioHelper.postData(
        url: 'api/Account/ResendConfirmation',
        queryParameters: {"Email":email},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(state.copyWith(status: RegisterStatus.resendSuccess));
      }
    } on DioException catch (e) {
      String errorMsg = 'Somthing went wrong';
      if (e.response != null && e.response?.data != null) {
        try {
          final errorModel = ErrorResponseModel.fromJson(e.response!.data);
          errorMsg = errorModel.errorMessage;
        } catch (_) {
          errorMsg = e.response?.data.toString() ?? 'Server Error';
        }
        print("Error: $errorMsg");
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            errorMessage: errorMsg,
          ),
        );
      }else {
        errorMsg = "Check your internet connection";
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            errorMessage: errorMsg,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
