enum RegisterStatus { initial, loading, registerSuccess,resendSuccess,
  verifySuccess, failure }

class DoctorRegisterState {
  final int? userRole;
  final String? firstName;
  final String? lastName;
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? city;
  final String? medicalSpecialty;
  final String? clinicName;
  final String? clinicAddress;
  final String? nationalID;
  final String? password;
  final String? confirmedPassword;
  final RegisterStatus status;

  final double passwordStrength;
  final bool isMiniEightOrSpecialChar;
  final bool lowerUpperChars;
  final bool oneNumber;
  final bool isMatched;

  final bool isLoading;
  final String? errorMessage;

  DoctorRegisterState({
    this.userRole,
    this.firstName,
    this.lastName,
    this.userName,
    this.phoneNumber,
    this.email,
    this.city,
    this.medicalSpecialty,
    this.clinicName,
    this.clinicAddress,
    this.nationalID,
    this.password,
    this.confirmedPassword,

    this.passwordStrength = 0,
    this.isMiniEightOrSpecialChar = false,
    this.lowerUpperChars = false,
    this.oneNumber = false,
    this.isMatched = false,
    this.isLoading = false,
    this.errorMessage,
    this.status = RegisterStatus.initial,
  });

  DoctorRegisterState copyWith({
    int? userRole,
    String? firstName,
    String? lastName,
    String? userName,
    String? phoneNumber,
    String? email,
    String? password,
    String? confirmedPassword,
    String? city,
    String? medicalSpecialty,
    String? clinicName,
    String? clinicAddress,
    String? nationalID,
    double? passwordStrength,
    bool? isMiniEightOrSpecialChar,
    bool? lowerUpperChars,
    bool? oneNumber,
    bool? isMatched,
    bool? isLoading,
    String? errorMessage,
    RegisterStatus? status,
  }) {
    return DoctorRegisterState(
      userRole: userRole ?? this.userRole,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      city: city ?? this.city,
      medicalSpecialty: medicalSpecialty ?? this.medicalSpecialty,
      clinicName: clinicName ?? this.clinicName,
      clinicAddress: clinicAddress ?? this.clinicAddress,
      nationalID: nationalID ?? this.nationalID,
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
