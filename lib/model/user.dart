//
// import 'package:json_annotation/json_annotation.dart';
//
//
// @JsonSerializable()
// class User{
//   bool success;
//   String message;
//   Data data;
//   User();
//   factory User.fromJson(json) => _$UserFromJson(json);
// }
//
// @JsonSerializable()
// class Data{
//   String encryptedPassword;
//   int id;
//   Null deviceType;
//   String email;
//   String fullName;
//   String dob;
//   Null resetPasswordToken;
//   Null resetPasswordSentAt;
//   Null rememberCreatedAt;
//   String createdAt;
//   String updatedAt;
//   Null passwordToken;
//   String gender;
//   double latitude;
//   double longitude;
//   String contact;
//   String fcmKey;
//   String profileImage;
//   String authToken;
//   Data();
//   factory Data.fromJson(json) => _$DataFromJson(json);
// }

//
// class User {
//   bool success;
//   String message;
//   Data data;
//
//   User({this.success, this.message, this.data});
//
//   User.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String encryptedPassword;
//   int id;
//   Null deviceType;
//   String email;
//   String fullName;
//   String dob;
//   Null resetPasswordToken;
//   Null resetPasswordSentAt;
//   Null rememberCreatedAt;
//   String createdAt;
//   String updatedAt;
//   Null passwordToken;
//   String gender;
//   double latitude;
//   double longitude;
//   String contact;
//   String fcmKey;
//   String profileImage;
//   String authToken;
//
//   Data({this.encryptedPassword,
//     this.id,
//     this.deviceType,
//     this.email,
//     this.fullName,
//     this.dob,
//     this.resetPasswordToken,
//     this.resetPasswordSentAt,
//     this.rememberCreatedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.passwordToken,
//     this.gender,
//     this.latitude,
//     this.longitude,
//     this.contact,
//     this.fcmKey,
//     this.profileImage,
//     this.authToken});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     encryptedPassword = json['encrypted_password'];
//     id = json['id'];
//     deviceType = json['device_type'];
//     email = json['email'];
//     fullName = json['full_name'];
//     dob = json['dob'];
//     resetPasswordToken = json['reset_password_token'];
//     resetPasswordSentAt = json['reset_password_sent_at'];
//     rememberCreatedAt = json['remember_created_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     passwordToken = json['password_token'];
//     gender = json['gender'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     contact = json['contact'];
//     fcmKey = json['fcm_key'];
//     profileImage = json['profile_image'];
//     authToken = json['auth_token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['encrypted_password'] = this.encryptedPassword;
//     data['id'] = this.id;
//     data['device_type'] = this.deviceType;
//     data['email'] = this.email;
//     data['full_name'] = this.fullName;
//     data['dob'] = this.dob;
//     data['reset_password_token'] = this.resetPasswordToken;
//     data['reset_password_sent_at'] = this.resetPasswordSentAt;
//     data['remember_created_at'] = this.rememberCreatedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['password_token'] = this.passwordToken;
//     data['gender'] = this.gender;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['contact'] = this.contact;
//     data['fcm_key'] = this.fcmKey;
//     data['profile_image'] = this.profileImage;
//     data['auth_token'] = this.authToken;
//     return data;
//   }
// }



class UserLogin {
  bool success;
  int statusCode;
  String message;
  Data data;

  UserLogin({this.success, this.statusCode, this.message, this.data});

  UserLogin.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  User user;
  int profileStatus;
  int coursesStatus;
  int assessmentStatus;
  int formsStatus;
  int certificatesStatus;
  int accessCardsStatus;
  String welcomeMessage;

  Data(
      {this.user,
        this.profileStatus,
        this.coursesStatus,
        this.assessmentStatus,
        this.formsStatus,
        this.certificatesStatus,
        this.accessCardsStatus,
        this.welcomeMessage});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    profileStatus = json['profile_status'];
    coursesStatus = json['courses_status'];
    assessmentStatus = json['assessment_status'];
    formsStatus = json['forms_status'];
    certificatesStatus = json['certificates_status'];
    accessCardsStatus = json['access_cards_status'];
    welcomeMessage = json['welcome_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['profile_status'] = this.profileStatus;
    data['courses_status'] = this.coursesStatus;
    data['assessment_status'] = this.assessmentStatus;
    data['forms_status'] = this.formsStatus;
    data['certificates_status'] = this.certificatesStatus;
    data['access_cards_status'] = this.accessCardsStatus;
    data['welcome_message'] = this.welcomeMessage;
    return data;
  }
}

class User {
  int id;
  String email;
  String name;
  String surname;
  String role;
  String idType;
  String idNumber;
  Company company;
  String image;
  bool lockImage;
  String createdAt;
  String updatedAt;
  String authToken;

  User(
      {this.id,
        this.email,
        this.name,
        this.surname,
        this.role,
        this.idType,
        this.idNumber,
        this.company,
        this.image,
        this.lockImage,
        this.createdAt,
        this.updatedAt,
        this.authToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    surname = json['surname'];
    role = json['role'];
    idType = json['id_type'];
    idNumber = json['id_number'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    image = json['image'];
    lockImage = json['lock_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['role'] = this.role;
    data['id_type'] = this.idType;
    data['id_number'] = this.idNumber;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    data['image'] = this.image;
    data['lock_image'] = this.lockImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['auth_token'] = this.authToken;
    return data;
  }
}

class Company {
  int id;
  String name;
  String vat;
  String address;
  String createdAt;
  String updatedAt;
  String sageIdentifier;
  bool emailStatus;
  bool smsStatus;

  Company(
      {this.id,
        this.name,
        this.vat,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.sageIdentifier,
        this.emailStatus,
        this.smsStatus});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vat = json['vat'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sageIdentifier = json['sage_identifier'];
    emailStatus = json['email_status'];
    smsStatus = json['sms_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['vat'] = this.vat;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['sage_identifier'] = this.sageIdentifier;
    data['email_status'] = this.emailStatus;
    data['sms_status'] = this.smsStatus;
    return data;
  }
}

