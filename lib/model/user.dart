

class User {
  bool success;
  int statusCode;
  String message;
  Data data;

  User({this.success, this.statusCode, this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
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
  Geofence geofence;

  Data({this.geofence});

  Data.fromJson(Map<String, dynamic> json) {
    geofence = json['geofence'] != null
        ? new Geofence.fromJson(json['geofence'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geofence != null) {
      data['geofence'] = this.geofence.toJson();
    }
    return data;
  }
}

class Geofence {
  int id;
  String longitude;
  String latitude;
  int siteNumber;
  int deptInCharge;
  String siteName;
  String person;
  String email;
  String createdAt;
  String updatedAt;
  String physicalAddress;
  String usnCode1;
  String usnCode2;
  String hospitalGroup;
  String secondaryEmail;
  bool smsStatus;
  bool emailStatus;
  String popupMessage;
  String phoneNumber;
  String additionalEmails;
  String fcmToken;
  String authToken;

  Geofence(
      {this.id,
        this.longitude,
        this.latitude,
        this.siteNumber,
        this.deptInCharge,
        this.siteName,
        this.person,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.physicalAddress,
        this.usnCode1,
        this.usnCode2,
        this.hospitalGroup,
        this.secondaryEmail,
        this.smsStatus,
        this.emailStatus,
        this.popupMessage,
        this.phoneNumber,
        this.additionalEmails,
        this.fcmToken,
        this.authToken});

  Geofence.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['id'] ?? "";
    longitude = json['longitude'] ?? json['longitude'] ?? "";
    latitude = json['latitude'] ?? json['latitude'] ?? "";
    siteNumber = json['site_number'] ?? json['site_number'] ?? 0;
    deptInCharge = json['dept_in_charge'] ?? json['dept_in_charge'] ?? 0;
    siteName = json['site_name'] ?? json['site_name'] ?? "";
    person = json['person'] ?? json['person'] ?? "";
    email = json['email'] ?? json['email'] ?? "";
    createdAt = json['created_at'] ?? json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? json['updated_at'] ?? "";
    physicalAddress = json['physical_address'] ?? json['physical_address'] ?? "";
    usnCode1 = json['usn_code_1'] ?? json['usn_code_1'] ?? "";
    usnCode2 = json['usn_code_2'] ?? json['usn_code_2'] ?? "";
    hospitalGroup = json['hospital_group'] ?? json['hospital_group'] ?? "";
    secondaryEmail = json['secondary_email'] ?? json['secondary_email'] ?? "";
    smsStatus = json['sms_status'] ?? json['sms_status'] ?? "";
    emailStatus = json['email_status'] ?? json['email_status'] ?? "";
    popupMessage = json['popup_message'] ?? json['popup_message'] ?? "";
    phoneNumber = json['phone_number'] ?? json['phone_number'] ?? "";
    additionalEmails = json['additional_emails'] ?? json['additional_emails'] ?? "";
    fcmToken = json['fcm_token'] ?? json['fcm_token'] ?? "";
    authToken = json['auth_token'] ?? json['auth_token'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['site_number'] = this.siteNumber;
    data['dept_in_charge'] = this.deptInCharge;
    data['site_name'] = this.siteName;
    data['person'] = this.person;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['physical_address'] = this.physicalAddress;
    data['usn_code_1'] = this.usnCode1;
    data['usn_code_2'] = this.usnCode2;
    data['hospital_group'] = this.hospitalGroup;
    data['secondary_email'] = this.secondaryEmail;
    data['sms_status'] = this.smsStatus;
    data['email_status'] = this.emailStatus;
    data['popup_message'] = this.popupMessage;
    data['phone_number'] = this.phoneNumber;
    data['additional_emails'] = this.additionalEmails;
    data['auth_token'] = this.authToken;
    return data;
  }
}
