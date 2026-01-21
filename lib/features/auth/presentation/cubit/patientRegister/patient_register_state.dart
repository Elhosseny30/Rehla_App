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

  final bool isLoading;
  final String? errorMessage;

  final double passwordStrength;
  final bool isMiniEightOrSpecialChar;
  final bool lowerUpperChars;
  final bool oneNumber;
  final bool isMatched;

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
    this.isLoading = false,
    this.errorMessage,
    this.passwordStrength = 0,
    this.isMiniEightOrSpecialChar = false,
    this.lowerUpperChars = false,
    this.oneNumber = false,
    this.isMatched = false,
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
    bool? isLoading,
    String? errorMessage,
    double? passwordStrength,
    bool? isMiniEightOrSpecialChar,
    bool? lowerUpperChars,
    bool? oneNumber,
    bool? isMatched,
  }) {
    return PatientRegisterState(
      userRole: userRole ?? this.userRole,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: username ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      birthOfDate: birthDate ?? this.birthOfDate,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      illnessStage: illnessStage ?? this.illnessStage,
      journeyStage: journeyStage ?? this.journeyStage,
      currentConcern: currentConcern ?? this.currentConcern,
      dailyRole: dailyRole ?? this.dailyRole,
      hobby: hobby ?? this.hobby,
      interests: interest ?? this.interests,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      passwordStrength: passwordStrength ?? this.passwordStrength,
      isMiniEightOrSpecialChar: isMiniEightOrSpecialChar ?? this.isMiniEightOrSpecialChar,
      lowerUpperChars: lowerUpperChars ?? this.lowerUpperChars,
      oneNumber: oneNumber ?? this.oneNumber,
      isMatched: isMatched ?? this.isMatched,

      
      
    );
  }
}
