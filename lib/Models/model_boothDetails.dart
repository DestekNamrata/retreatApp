class BoothDetailsRepo {
  bool? success;
  dynamic data;
  dynamic punchIn;


  BoothDetailsRepo({this.success, this.data, this.punchIn});

  factory BoothDetailsRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return BoothDetailsRepo(
        success: json['success'],
        data: json['data'],
        punchIn: json['punch_in']
      );
    } catch (error) {
      return BoothDetailsRepo(
        success: false,
        data: null,
        punchIn: null,
      );
    }
  }

  // Autogenerated.fromJson(Map<String, dynamic> json) {
  //   success = json['success'];
  //   if (json['data'] != null) {
  //     data = <Data>[];
  //     json['data'].forEach((v) {
  //       data!.add(new Data.fromJson(v));
  //     });
  //   }
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['success'] = this.success;
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class BoothDetailsModel {
  int? id;
  String? stallName;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  BoothDetailsModel(
      {this.id,
        this.stallName,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt});

  BoothDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stallName = json['stall_name'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stall_name'] = this.stallName;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}