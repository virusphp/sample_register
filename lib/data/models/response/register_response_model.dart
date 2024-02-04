import 'dart:convert';

class RegisterResponseModel {
  int? code;
  String? message;
  Result? result;

  RegisterResponseModel({
    this.code,
    this.message,
    this.result,
  });

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        code: json["code"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "result": result?.toMap(),
      };
}

class Result {
  Access? access;
  String? apiToken;

  Result({
    this.access,
    this.apiToken,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        access: json["access"] == null ? null : Access.fromMap(json["access"]),
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toMap() => {
        "access": access?.toMap(),
        "api_token": apiToken,
      };
}

class Access {
  String? nama;
  String? email;
  String? username;
  DateTime? createdAt;
  DateTime? updatedAt;

  Access({
    this.nama,
    this.email,
    this.username,
    this.createdAt,
    this.updatedAt,
  });

  factory Access.fromJson(String str) => Access.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Access.fromMap(Map<String, dynamic> json) => Access(
        nama: json["nama"],
        email: json["email"],
        username: json["username"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "email": email,
        "username": username,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
