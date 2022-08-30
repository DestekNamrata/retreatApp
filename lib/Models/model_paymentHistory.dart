class AttendanceHistoryRepo {
  bool? success;
  dynamic data;

  AttendanceHistoryRepo({this.success, this.data});


  factory AttendanceHistoryRepo.fromJson(Map<dynamic, dynamic> json) {
    try {
      return AttendanceHistoryRepo(
        success: json['success'],
        data: json['data'],
      );
    } catch (error) {
      return AttendanceHistoryRepo(
        success: false,
        data: null,
      );
    }
  }

  // AttendanceHistoryRepo.fromJson(Map<String, dynamic> json) {
  //   success = json['success'];
  //   if (json['data'] != null) {
  //     data = <AttendanceHistoryModel>[];
  //     json['data'].forEach((v) {
  //       data!.add(new AttendanceHistoryModel.fromJson(v));
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

class AttendanceHistoryModel {
  int? id;
  int? userId;
  int? attendanceType;
  int? roomNo;
  int? checkIn;
  int? checkOut;
  String? createdAt;
  String? updatedAt;
  String? checkinTime;
  String? checkoutTime;
  String? duration;

  AttendanceHistoryModel(
      {this.id,
        this.userId,
        this.attendanceType,
        this.roomNo,
        this.checkIn,
        this.checkOut,
        this.createdAt,
        this.updatedAt,
        this.checkinTime,
        this.checkoutTime,
        this.duration});

  AttendanceHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    attendanceType = json['attendance_type'];
    roomNo = json['room_no'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    checkinTime = json['checkin_time'];
    checkoutTime = json['checkout_time'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['attendance_type'] = this.attendanceType;
    data['room_no'] = this.roomNo;
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['checkin_time'] = this.checkinTime;
    data['checkout_time'] = this.checkoutTime;
    data['duration'] = this.duration;
    return data;
  }
}