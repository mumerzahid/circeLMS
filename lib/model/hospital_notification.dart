class NotificationsModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  NotificationsModel({this.success, this.statusCode, this.message, this.data});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
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
  List<HospitalNotifications> hospitalNotifications;

  Data({this.hospitalNotifications});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['hospital_notifications'] != null) {
      hospitalNotifications = new List<HospitalNotifications>();
      json['hospital_notifications'].forEach((v) {
        hospitalNotifications.add(new HospitalNotifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hospitalNotifications != null) {
      data['hospital_notifications'] =
          this.hospitalNotifications.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HospitalNotifications {
  int id;
  String title;
  String description;
  int geofenceId;
  String createdAt;
  String updatedAt;

  HospitalNotifications(
      {this.id,
        this.title,
        this.description,
        this.geofenceId,
        this.createdAt,
        this.updatedAt});

  HospitalNotifications.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['id'] ?? "";
    title = json['title'] ?? json['title'] ?? "";
    description = json['description'] ?? json['description'] ?? "";
    geofenceId = json['geofence_id'] ?? json['geofence'] ?? "";
    createdAt = json['created_at'] ?? json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['geofence_id'] = this.geofenceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}