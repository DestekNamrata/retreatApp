class RoomListResp {
  dynamic success;
  dynamic data;

  RoomListResp({this.success, this.data});

  factory RoomListResp.fromJson(Map<dynamic, dynamic> json) {
    try {
      return RoomListResp(
          success: json['success'],
          data: json['data'],

      );
    } catch (error) {
      return RoomListResp(
        data: null,
        success: false,
      );
    }
  }

}

class RoomData {
  int? id;
  String? roomName;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  RoomData(
      {this.id, this.roomName, this.deletedAt, this.createdAt, this.updatedAt});

  RoomData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['room_name'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_name'] = this.roomName;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
