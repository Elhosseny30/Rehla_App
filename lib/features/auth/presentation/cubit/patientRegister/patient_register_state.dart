enum RegisterStatus {
  initial,
  loading,
  registerSuccess,
  verifySuccess,
  resendSuccess,
  failure,
}

class PatientRegisterState {
  final int? userRole;

  final String? firstName;
  final String? lastName;
  final String? userName;
  final String? phoneNumber;
  final String? email;

  final String? birthOfDate;
  final String? height;
  final String? weight;
  final String? illnessStage;
  final String? journeyStage;
  final String? currentConcern;

  final String? dailyRole;
  final String? hobby;
  final String? interests;
  final String? password;
  final String? confirmedPassword;

  final bool isLoading;
  final String? errorMessage;

  final double passwordStrength;
  final bool isMiniEightOrSpecialChar;
  final bool lowerUpperChars;
  final bool oneNumber;
  final bool isMatched;
  final RegisterStatus status;

  PatientRegisterState({
    this.userRole,
    this.firstName,
    this.lastName,
    this.userName,
    this.phoneNumber,
    this.email,
    this.birthOfDate,
    this.height,
    this.weight,
    this.illnessStage,
    this.journeyStage,
    this.currentConcern,
    this.dailyRole,
    this.hobby,
    this.interests,
    this.password,
    this.confirmedPassword,
    this.isLoading = false,
    this.errorMessage,
    this.passwordStrength = 0,
    this.isMiniEightOrSpecialChar = false,
    this.lowerUpperChars = false,
    this.oneNumber = false,
    this.isMatched = false,
    this.status = RegisterStatus.initial,
  });

  PatientRegisterState copyWith({
    int? userRole,
    String? firstName,
    String? lastName,
    String? username,
    String? phoneNumber,
    String? email,
    String? birthDate,
    String? height,
    String? weight,
    String? illnessStage,
    String? journeyStage,
    String? currentConcern,
    String? dailyRole,
    String? hobby,
    String? interest,
    String? password,
    String? confirmedPassword,
    bool? isLoading,
    String? errorMessage,
    double? passwordStrength,
    bool? isMiniEightOrSpecialChar,
    bool? lowerUpperChars,
    bool? oneNumber,
    bool? isMatched,
    RegisterStatus? status,
  }) {
    return PatientRegisterState(
      userRole: userRole ?? this.userRole,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: username ?? userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      birthOfDate: birthDate ?? birthOfDate,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      illnessStage: illnessStage ?? this.illnessStage,
      journeyStage: journeyStage ?? this.journeyStage,
      currentConcern: currentConcern ?? this.currentConcern,
      dailyRole: dailyRole ?? this.dailyRole,
      hobby: hobby ?? this.hobby,
      interests: interest ?? interests,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      passwordStrength: passwordStrength ?? this.passwordStrength,
      isMiniEightOrSpecialChar:
          isMiniEightOrSpecialChar ?? this.isMiniEightOrSpecialChar,
      lowerUpperChars: lowerUpperChars ?? this.lowerUpperChars,
      oneNumber: oneNumber ?? this.oneNumber,
      isMatched: isMatched ?? this.isMatched,
      status: status ?? this.status,
    );
  }
}
