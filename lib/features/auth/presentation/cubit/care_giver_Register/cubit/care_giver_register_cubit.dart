import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:graduationproject/core/utils/DioHelper.dart';
import 'package:graduationproject/core/utils/error.dart';
import 'package:graduationproject/features/auth/data/models/register_response_model.dart';

part 'care_giver_register_state.dart';

class CareGiverRegisterCubit extends Cubit<CareGiverRegisterState> {
  CareGiverRegisterCubit() : super(CareGiverRegisterState());

  void updateBasicsInfo({
    String? fName,
    String? lName,
    String? email,
    String? userName,
    int? role,
  }) {
    emit(
      state.copywith(
        firstName: fName,
        lastName: lName,
        email: email,
        userName: userName,
        userRole: role,
        errorMessage: null,
        status: RegisterStatus.initial,
      ),
    );
  }

  void updateSupportInfo({
    String? whoIsSupported,
    String? theirNickName,
    String? typeOfSupporting,
  }) {
    emit(
      state.copywith(
        whoSupporting: whoIsSupported,
        patientName: theirNickName,
        supportType: typeOfSupporting,
      ),
    );
  }

  void updateJourneyInfo({
    String? age,
    String? roleDay,
    String? describeJourney,
    String? durationOfCareGiver,
  }) {
    emit(
      state.copywith(
        age: age,
        dailyRole: roleDay,
        journeyDescription: describeJourney,
        careGiverDuration: durationOfCareGiver,
      ),
    );
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
    if (password.isNotEmpty &&
        confirmedPassword.isNotEmpty &&
        password == confirmedPassword) {
      tempIsIsMatched = true;
      score++;
    }

    emit(
      state.copywith(
        password: password,
        confirmedPassword: confirmedPassword,
        isMiniEightOrSpecialChar: tempIsMiniEightOrSpecialChar,
        lowerUpperChars: tempIsLowerUpperChars,
        oneNumber: tempIsOneNumber,
        isMatched: tempIsIsMatched,
        passwordStrength: score / 4,
        errorMessage: null,
        status: RegisterStatus.initial,
      ),
    );
  }

  Future<void> submitRegisterCareGiver() async {
    emit(state.copywith(status: RegisterStatus.loading));

    try {
      final Map<String, dynamic> requestData = {
        "firstName": state.firstName,
        "lastName": state.lastName,
        "username": state.userName,
        "email": state.email,
        "password": state.password,
        "confirmPassword": state.confirmedPassword,
        "age": state.age,
        "supportingWhom": state.whoSupporting,
        "patientNickname": state.patientName,
        "supportType": state.supportType,
        "dailyRole": state.dailyRole,
        "journeyDescription": state.journeyDescription,
        "caregiverDuration": state.careGiverDuration,
        "phoneNumber" : "01007123597",
        "patientEmail": "mahitab@gmail.com",
        "address": "elmoderia",

      };
      print("Sending data: $requestData");

      final response = await DioHelper.postData(
        url: 'api/Account/Register/Caregiver',
        data: requestData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final successModel = RegisterResponseModel.fromJson(response.data);
        emit(state.copywith(status: RegisterStatus.success));
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
        state.copywith(status: RegisterStatus.failure, errorMessage: errorMsg),
      );
    } catch (e) {
      emit(
        state.copywith(
          status: RegisterStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
