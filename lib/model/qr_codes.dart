class QrCodesModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  QrCodesModel({this.success, this.statusCode, this.message, this.data});

  QrCodesModel.fromJson(Map<String, dynamic> json) {
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
  List<Qrcodes> qrcodes;

  Data({this.qrcodes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['qrcodes'] != null) {
      qrcodes = new List<Qrcodes>();
      json['qrcodes'].forEach((v) {
        qrcodes.add(new Qrcodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.qrcodes != null) {
      data['qrcodes'] = this.qrcodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Qrcodes {
  int id;
  String level;
  String visitStatus;
  int geofenceId;
  String createdAt;
  String updatedAt;
  String imageFileUrl;

  Qrcodes(
      {this.id,
        this.level,
        this.visitStatus,
        this.geofenceId,
        this.createdAt,
        this.updatedAt,
        this.imageFileUrl});

  Qrcodes.fromJson(Map<String, dynamic> json) {
    id = json['id']?? json['id'] ?? "";
    level = json['level']?? json['level'] ?? "";
    visitStatus = json['visit_status']?? json['visit_status'] ?? "";
    geofenceId = json['geofence_id']?? json['geofence_id'] ?? "";
    createdAt = json['created_at']?? json['created_at'] ?? "";
    updatedAt = json['updated_at']?? json['updated_at'] ?? "";
    imageFileUrl = json['image_file_url']?? json['image_file_url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    data['visit_status'] = this.visitStatus;
    data['geofence_id'] = this.geofenceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_file_url'] = this.imageFileUrl;
    return data;
  }
}