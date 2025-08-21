
class LoginModel {
    String? token;
    String? id;
    String? fullName;
    String? email;
    String? phone;
    int? v;
    String? profilePhoto;
    String? fcmToken;
    String? resetPasswordExpires;
    String? resetPasswordToken;

    LoginModel({this.token, this.id, this.fullName, this.email, this.phone, this.v, this.profilePhoto, this.fcmToken, this.resetPasswordExpires, this.resetPasswordToken});

    LoginModel.fromJson(Map<String, dynamic> json) {
        if(json["token"] is String) {
            token = json["token"];
        }
        if(json["_id"] is String) {
            id = json["_id"];
        }
        if(json["fullName"] is String) {
            fullName = json["fullName"];
        }
        if(json["email"] is String) {
            email = json["email"];
        }
        if(json["phone"] is String) {
            phone = json["phone"];
        }
        if(json["__v"] is num) {
            v = (json["__v"] as num).toInt();
        }
        if(json["profilePhoto"] is String) {
            profilePhoto = json["profilePhoto"];
        }
        if(json["fcmToken"] is String) {
            fcmToken = json["fcmToken"];
        }
        if(json["resetPasswordExpires"] is String) {
            resetPasswordExpires = json["resetPasswordExpires"];
        }
        if(json["resetPasswordToken"] is String) {
            resetPasswordToken = json["resetPasswordToken"];
        }
    }

    static List<LoginModel> fromList(List<Map<String, dynamic>> list) {
        return list.map(LoginModel.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["token"] = token;
        _data["_id"] = id;
        _data["fullName"] = fullName;
        _data["email"] = email;
        _data["phone"] = phone;
        _data["__v"] = v;
        _data["profilePhoto"] = profilePhoto;
        _data["fcmToken"] = fcmToken;
        _data["resetPasswordExpires"] = resetPasswordExpires;
        _data["resetPasswordToken"] = resetPasswordToken;
        return _data;
    }

    LoginModel copyWith({
        String? token,
        String? id,
        String? fullName,
        String? email,
        String? phone,
        int? v,
        String? profilePhoto,
        String? fcmToken,
        String? resetPasswordExpires,
        String? resetPasswordToken,
    }) => LoginModel(
        token: token ?? this.token,
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        v: v ?? this.v,
        profilePhoto: profilePhoto ?? this.profilePhoto,
        fcmToken: fcmToken ?? this.fcmToken,
        resetPasswordExpires: resetPasswordExpires ?? this.resetPasswordExpires,
        resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
    );
}