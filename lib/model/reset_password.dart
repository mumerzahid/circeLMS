
class PasswordReset {
  bool success;
  int statusCode;
  String message;
  // Data data;

  PasswordReset({this.success, this.statusCode, this.message, });
  // this.data

  PasswordReset.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    // data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    // if (this.data != null) {
    //   data['data'] = this.data.toJson();
    // }
    // return data;
  }
}

// class Data {
//
//
//   Data({
//
// });
//
// Data.fromJson(Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   return data;
// }
// }