class ResultLogin {
  dynamic success;
  dynamic msg;
  dynamic token;
  dynamic data;

  ResultLogin({this.success,this.msg, this.token, this.data});

  // ResultLogin.fromJson(Map<String, dynamic> json) {
  //   success = json['success'];
  //   token = json['token'];
  //   data = json['data'] != null ? new User.fromJson(json['data']) : null;
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['success'] = this.success;
  //   data['token'] = this.token;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }

  factory ResultLogin.fromJson(Map<dynamic, dynamic> json) {
    try {
      return ResultLogin(
        success: json['success'],
        msg: json['msg'],
          token: json['token'],
        data: json['data']

      );
    } catch (error) {
      return ResultLogin(
        token: '',
        data: null,
        success: false,
      );
    }
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  dynamic address;
  dynamic countryId;
  dynamic stateId;
  dynamic city;
  dynamic phone;
  String? mobile;
  int? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.address,
        this.countryId,
        this.stateId,
        this.city,
        this.phone,
        this.mobile,
        this.role,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    address = json['address'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    city = json['city'];
    phone = json['phone'];
    mobile = json['mobile'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['address'] = this.address;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city'] = this.city;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
