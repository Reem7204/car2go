class SignUpModel {
  final String fullName;
  final String email;
  final String phone;
  final String? profilePhoto;
  final String? fcmToken;
  final String? resetPasswordToken;
  final String? resetPasswordExpires;
  final String id;

  SignUpModel({
    required this.fullName,
    required this.email,
    required this.phone,
    this.profilePhoto,
    this.fcmToken,
    this.resetPasswordToken,
    this.resetPasswordExpires,
    required this.id,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      profilePhoto: json['profilePhoto'],
      fcmToken: json['fcmToken'],
      resetPasswordToken: json['resetPasswordToken'],
      resetPasswordExpires: json['resetPasswordExpires'],
      id: json['_id'],
    );
  }
}
