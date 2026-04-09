import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:graduationproject/core/utils/DioHelper.dart';
import 'package:graduationproject/core/utils/error.dart';
import 'package:graduationproject/features/auth/data/models/register_response_model.dart';
import 'package:graduationproject/features/auth/presentation/cubit/doctorRegister/doctor_register_state.dart';

class DoctorRegisterCubit extends Cubit<DoctorRegisterState> {
  DoctorRegisterCubit() : super(DoctorRegisterState());

  void updateBasicInfo({
    String? fName,
    String? lName,
    String? email,
    String? phone,
    String? userName,
    int? role,
  }) {
    emit(
      state.copyWith(
        firstName: fName,
        lastName: lName,
        email: email,
        phoneNumber: phone,
        userName: userName,
        userRole: role,

        errorMessage: null,
        status: RegisterStatus.initial,
      ),
    );
  }

  void updateClinicInfo({
    String? city,
    String? specialty,
    String? clinicName,
    String? clinicAddress,
  }) {
    emit(
      state.copyWith(
        city: city,
        medicalSpecialty: specialty,
        clinicName: clinicName,
        clinicAddress: clinicAddress,
      ),
    );
  }

  void updateNationalID({String? id}) {
    emit(state.copyWith(nationalID: id));
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
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        isMiniEightOrSpecialChar: tempIsMiniEightOrSpecialChar,
        lowerUpperChars: tempIsLowerUpperChars,
        oneNumber: tempIsOneNumber,
        isMatched: tempIsIsMatched,
        passwordStrength: score / 4.0,
        errorMessage: null,
        status: RegisterStatus.initial,
      ),
    );
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
        "address": state.clinicAddress ?? state.city ?? "Egypt",
        "dateOfBirth": "1995-01-23",
        "gender": "Male",
        "yearsOfExperience": 5,
        "password": state.password,
        "confirmPassword": state.confirmedPassword,
        "specialization": state.medicalSpecialty ?? "General",
        "licenseNumber": state.nationalID,
        "nationalIdImagePath": 'https://img.freepik.com/free-photo/portrait-smiling-male-doctor_171337-149.jpg',
      };
      print("Sending data : $requestData");

      final response = await DioHelper.postData(
        url: 'api/Account/Register/Doctor',
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
      emit(
        state.copyWith(status: RegisterStatus.failure, errorMessage: errorMsg),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: e.toString(),
        ),
      );
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
