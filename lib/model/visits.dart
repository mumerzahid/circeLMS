class VisitModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  VisitModel({this.success, this.statusCode, this.message, this.data});

  VisitModel.fromJson(Map<String, dynamic> json) {
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
  List<Visits> visits;

  Data({this.visits});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['visits'] != null) {
      visits = new List<Visits>();
      json['visits'].forEach((v) {
        visits.add(new Visits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.visits != null) {
      data['visits'] = this.visits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Visits {
  String userName;
  String companyName;
  String companyPocName;
  String user_email;
  String companyPocEmail;
  String checkIn;
  String checkInTimeAndDate;
  String checkOut;
  String checkOutTimeAndDate;
  String level;

  Visits(
      {this.userName,
        this.companyName,
        this.companyPocName,
        this.user_email,
        this.companyPocEmail,
        this.checkIn,
        this.checkInTimeAndDate,
        this.checkOut,
        this.checkOutTimeAndDate,
        this.level
      }
        );

  Visits.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'] ?? json['user_name'] ?? "";
    companyName = json['company_name'] ?? json['company_name'] ?? "";
    companyPocName = json['company_poc_name'] ?? json['company_poc_name'] ?? "";
    user_email = json['user_email'] ?? json['user_email'] ?? "";
    companyPocEmail = json['company_poc_email'] ?? json['company_poc_email'] ?? "";
    checkIn = json['check_in'] ?? json['check_in'] ?? "";;
    checkInTimeAndDate = json['check_in_time_and_date'] ?? json['check_in_time_and_date'] ?? "";
    checkOut = json['check_out'] ?? json['check_out'] ?? "";
    checkOutTimeAndDate = json['check_out_time_and_date'] ?? json['check_out_time_and_date'] ?? "";
    level = json['level'] ?? json['level'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['company_name'] = this.companyName;
    data['company_poc_name'] = this.companyPocName;
    data['user_email'] = this.user_email;
    data['company_poc_email'] = this.companyPocEmail;
    data['check_in'] = this.checkIn;
    data['check_in_time_and_date'] = this.checkInTimeAndDate;
    data['check_out'] = this.checkOut;
    data['check_out_time_and_date'] = this.checkOutTimeAndDate;
    data['level'] = this.level;
    return data;
  }
}