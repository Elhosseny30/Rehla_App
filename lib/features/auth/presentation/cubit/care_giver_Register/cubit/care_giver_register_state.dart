part of 'care_giver_register_cubit.dart';

enum RegisterStatus { initial, loading, success, failure }

class CareGiverRegisterState {
  final int? userRole;
  final String? firstName;
  final String? lastName;
  final String? userName;
  final String? email;

  final String? whoSupporting;
  final String? patientName;
  final String? supportType;

  final String? age;
  final String? dailyRole;
  final String? journeyDescription;
  final String? careGiverDuration;

  final String? password;
  final String? confirmedPassword;
  final double? passwordStrength;
  final bool isMiniEightOrSpecialChar;
  final bool lowerUpperChars;
  final bool oneNumber;
  final bool isMatched;

  final RegisterStatus status;
  final bool isLoading;
  final String? errorMessage;

  CareGiverRegisterState({
    this.userRole,
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.whoSupporting,
    this.patientName,
    this.supportType,
    this.age,
    this.dailyRole,
    this.journeyDescription,
    this.careGiverDuration,
    this.password,
    this.confirmedPassword,
    this.passwordStrength = 0,
    this.isMiniEightOrSpecialChar = false,
    this.lowerUpperChars = false,
    this.oneNumber = false,
    this.isMatched = false,
    this.status = RegisterStatus.initial,
    this.isLoading = false,
    this.errorMessage,
  });

  CareGiverRegisterState copywith({
    int? userRole,
    String? firstName,
    String? lastName,
    String? userName,
    String? email,

    String? whoSupporting,
    String? patientName,
    String? supportType,

    String? age,
    String? dailyRole,
    String? journeyDescription,
    String? careGiverDuration,

    String? password,
    String? confirmedPassword,
    double? passwordStrength,
    bool? isMiniEightOrSpecialChar,
    bool? lowerUpperChars,
    bool? oneNumber,
    bool? isMatched,

    RegisterStatus? status,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CareGiverRegisterState(
      userRole: userRole ?? this.userRole,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      whoSupporting: whoSupporting ?? this.whoSupporting,
      patientName: patientName ?? this.patientName,
      supportType: supportType ?? this.supportType,
      age: age ?? this.age,
      dailyRole: dailyRole ?? this.dailyRole,
      journeyDescription: journeyDescription ?? this.journeyDescription,
      careGiverDuration: careGiverDuration ?? this.careGiverDuration,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      passwordStrength: passwordStrength ?? this.passwordStrength,
      isMiniEightOrSpecialChar:
          isMiniEightOrSpecialChar ?? this.isMiniEightOrSpecialChar,
      lowerUpperChars: lowerUpperChars ?? this.lowerUpperChars,
      oneNumber: oneNumber ?? this.oneNumber,
      isMatched: isMatched ?? this.isMatched,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
