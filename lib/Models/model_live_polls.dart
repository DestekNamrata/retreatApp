class LivePollsResp {
  dynamic success;
  dynamic data;

  LivePollsResp({this.success, this.data});

  factory LivePollsResp.fromJson(Map<dynamic, dynamic> json) {
    try {
      return LivePollsResp(
          success: json['success'],
          data: json['data'],

      );
    } catch (error) {
      return LivePollsResp(
        data: null,
        success: false,
      );
    }
  }
}

class LivePollsModel {
  int? id;
  String? question;
  dynamic imageUrl;
  List<Options>? options;
  int? isSubmit;

  LivePollsModel({this.id, this.question, this.imageUrl, this.options, this.isSubmit});

  LivePollsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    imageUrl = json['image_url'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    isSubmit = json['is_submit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['image_url'] = this.imageUrl;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['is_submit'] = this.isSubmit;
    return data;
  }
}

class Options {
  int? id;
  int? pollId;
  String? option;
  String? createdAt;
  String? updatedAt;

  Options({this.id, this.pollId, this.option, this.createdAt, this.updatedAt});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pollId = json['poll_id'];
    option = json['option'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['poll_id'] = this.pollId;
    data['option'] = this.option;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
