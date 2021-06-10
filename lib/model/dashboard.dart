class DashboardModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  DashboardModel({this.success, this.statusCode, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'].isEmpty ? null : Data.fromJson(json['data']);
    print(success);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != String) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Feeds> feeds;
  List<TrainingResources> trainingResources;

  Data({this.feeds, this.trainingResources});

  Data.fromJson(Map<String, dynamic> json) {
    // if(json.isEmpty){
    //   print("Data is null");
    // } else {
      if (json['feeds'] != String) {
        feeds = new List<Feeds>();
        json['feeds'].forEach((v) {
          feeds.add(new Feeds.fromJson(v));
        });
      }
      if (json['training_resources'] != String) {
        trainingResources = new List<TrainingResources>();
        json['training_resources'].forEach((v) {
          trainingResources.add(new TrainingResources.fromJson(v));
        });
      }
    // }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feeds != String) {
      data['feeds'] = this.feeds.map((v) => v.toJson()).toList();
    }
    if (this.trainingResources != String) {
      data['training_resources'] =
          this.trainingResources.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Feeds {
  int id;
  String content;
  String createdAt;
  String updatedAt;
  String imageFileName;
  String imageContentType;
  String imageFileSize;
  String imageUpdatedAt;
  String newsFeedTitle;
  String traningVideoTitle;
  String traningVideoLink;
  int cmsType;
  String documentFileName;
  String documentContentType;
  int documentFileSize;
  String documentUpdatedAt;
  String contentFor;
  String documentDownloadUrl;

  Feeds(
      {this.id,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.imageFileName,
        this.imageContentType,
        this.imageFileSize,
        this.imageUpdatedAt,
        this.newsFeedTitle,
        this.traningVideoTitle,
        this.traningVideoLink,
        this.cmsType,
        this.documentFileName,
        this.documentContentType,
        this.documentFileSize,
        this.documentUpdatedAt,
        this.contentFor,
        this.documentDownloadUrl});

  Feeds.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['id'] ?? "";
    content = json['content'] ?? json['content'] ?? "";
    createdAt = json['created_at'] ?? json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? json['updated_at'] ?? "";
    imageFileName = json['image_file_name'] ?? json['image_file_name'] ?? "";
    imageContentType = json['image_content_type'] ?? json['image_content_type'] ?? "";
    imageFileSize = json['image_file_size'] ?? json['image_file_size'] ?? "";
    imageUpdatedAt = json['image_updated_at'] ?? json['image_updated_at'] ?? "";
    newsFeedTitle = json['news_feed_title'] ?? json['new_feed_title'] ?? "";
    traningVideoTitle = json['traning_video_title'] ?? json['traning_video_title'] ?? "";
    traningVideoLink = json['traning_video_link'] ?? json['traning_video_title'] ?? "";
    cmsType = json['cms_type'] ?? json['cms_type'] ?? "";
    documentFileName = json['document_file_name'] ?? json['document_file_name'] ?? "";
    documentContentType = json['document_content_type'] ?? json['document_content_type'] ?? "";
    documentFileSize = json['document_file_size'] ?? json['document_file_size'] ?? 0;
    documentUpdatedAt = json['document_updated_at'] ?? json['document_updated_at'] ?? "";
    contentFor = json['content_for'] ?? json['content_for'] ?? "";
    documentDownloadUrl = json['document_download_url'] ?? json['document_download_url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_file_name'] = this.imageFileName;
    data['image_content_type'] = this.imageContentType;
    data['image_file_size'] = this.imageFileSize;
    data['image_updated_at'] = this.imageUpdatedAt;
    data['news_feed_title'] = this.newsFeedTitle;
    data['traning_video_title'] = this.traningVideoTitle;
    data['traning_video_link'] = this.traningVideoLink;
    data['cms_type'] = this.cmsType;
    data['document_file_name'] = this.documentFileName;
    data['document_content_type'] = this.documentContentType;
    data['document_file_size'] = this.documentFileSize;
    data['document_updated_at'] = this.documentUpdatedAt;
    data['content_for'] = this.contentFor;
    data['document_download_url'] = this.documentDownloadUrl;
    return data;
  }
}

class TrainingResources {
  int id;
  String content;
  String createdAt;
  String updatedAt;
  String imageFileName;
  String imageContentType;
  String imageFileSize;
  String imageUpdatedAt;
  String newsFeedTitle;
  String traningVideoTitle;
  String traningVideoLink;
  int cmsType;
  String documentFileName;
  String documentContentType;
  int documentFileSize;
  String documentUpdatedAt;
  String contentFor;
  String documentDownloadUrl;

  TrainingResources(
      {this.id,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.imageFileName,
        this.imageContentType,
        this.imageFileSize,
        this.imageUpdatedAt,
        this.newsFeedTitle,
        this.traningVideoTitle,
        this.traningVideoLink,
        this.cmsType,
        this.documentFileName,
        this.documentContentType,
        this.documentFileSize,
        this.documentUpdatedAt,
        this.contentFor,
        this.documentDownloadUrl});

  TrainingResources.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['id'] ?? "";
    content = json['content'] ?? json['content'] ?? "";
    createdAt = json['created_at'] ?? json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? json['updated_at'] ?? "";
    imageFileName = json['image_file_name'] ?? json['image_file_name'] ?? "";
    imageContentType = json['image_content_type'] ?? json['image_content_type'] ?? "";
    imageFileSize = json['image_file_size'] ?? json['image_file_size'] ?? "";
    imageUpdatedAt = json['image_updated_at'] ?? json['image_update_at'] ?? "";
    newsFeedTitle = json['news_feed_title'] ?? json['news_feed_title'] ?? "";
    traningVideoTitle = json['traning_video_title'] ?? json['traning_video_title'] ?? "";
    traningVideoLink = json['traning_video_link'] ?? json['traning_video_link'] ?? "";
    cmsType = json['cms_type'] ?? json['cms'] ?? "";
    documentFileName = json['document_file_name'] ?? json['document_file_name'] ?? "";
    documentContentType = json['document_content_type'] ?? json['document_content_type'] ?? "";
    documentFileSize = json['document_file_size'] ?? json['document_file_size'] ?? 0;
    documentUpdatedAt = json['document_updated_at'] ?? json['document_updated_at'] ?? "";
    contentFor = json['content_for'] ?? json['content_for'] ?? "";
    documentDownloadUrl = json['document_download_url'] ?? json['document_download_url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_file_name'] = this.imageFileName;
    data['image_content_type'] = this.imageContentType;
    data['image_file_size'] = this.imageFileSize;
    data['image_updated_at'] = this.imageUpdatedAt;
    data['news_feed_title'] = this.newsFeedTitle;
    data['traning_video_title'] = this.traningVideoTitle;
    data['traning_video_link'] = this.traningVideoLink;
    data['cms_type'] = this.cmsType;
    data['document_file_name'] = this.documentFileName;
    data['document_content_type'] = this.documentContentType;
    data['document_file_size'] = this.documentFileSize;
    data['document_updated_at'] = this.documentUpdatedAt;
    data['content_for'] = this.contentFor;
    data['document_download_url'] = this.documentDownloadUrl;
    return data;
  }
}