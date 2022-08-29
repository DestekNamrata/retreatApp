class AttendanceDateResp {
  dynamic success;
  dynamic data;

  AttendanceDateResp({this.success, this.data});

  factory AttendanceDateResp.fromJson(Map<dynamic, dynamic> json) {
    try {
      return AttendanceDateResp(
          success: json['success'],
          data: json['data']

      );
    } catch (error) {
      return AttendanceDateResp(
        data: null,
        success: false,
      );
    }
  }

}

class Data {
  int? id;
  int? userId;
  int? attendanceType;
  int? roomNo;
  int? checkIn;
  int? checkOut;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.userId,
        this.attendanceType,
        this.roomNo,
        this.checkIn,
        this.checkOut,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    attendanceType = json['attendance_type'];
    roomNo = json['room_no'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
