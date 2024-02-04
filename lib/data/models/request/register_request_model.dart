import 'dart:convert';

class RegisterRequestModel {
  String? nama;
  String? username;
  String? email;
  String? password;
  String? repassword;
  String? phone;

  RegisterRequestModel({
    this.nama,
    this.username,
    this.email,
    this.password,
    this.repassword,
    this.phone,
  });

  factory RegisterRequestModel.fromJson(String str) =>
      RegisterRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) =>
      RegisterRequestModel(
        nama: json["nama"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        repassword: json["repassword"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "username": username,
        "email": email,
        "password": password,
        "repassword": repassword,
        "phone": phone,
      };
}
