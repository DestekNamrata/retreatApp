class AgendaRepo {
  bool? success;
  dynamic data;

  AgendaRepo({this.success, this.data});

  AgendaRepo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <AgendaModel>[];
      json['data'].forEach((v) {
        data!.add(new AgendaModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AgendaModel {
  int? id;
  Null? roomId;
  Null? referenceId;
  Null? eventTypeId;
  String? activity;
  String? description;
  String? eventDate;
  String? startTime;
  String? endTime;
  String? venue;
  String? spocName;
  String? contact;
  int? attendanceReq;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  AgendaModel(
      {this.id,
        this.roomId,
        this.referenceId,
        this.eventTypeId,
        this.activity,
        this.description,
        this.eventDate,
        this.startTime,
        this.endTime,
        this.venue,
        this.spocName,
        this.contact,
        this.attendanceReq,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  AgendaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomId = json['room_id'];
    referenceId = json['reference_id'];
    eventTypeId = json['event_type_id'];
    activity = json['activity'];
    description = json['description'];
    eventDate = json['event_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    venue = json['venue'];
    spocName = json['spoc_name'];
    contact = json['contact'];
    attendanceReq = json['attendance_req'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_id'] = this.roomId;
    data['reference_id'] = this.referenceId;
    data['event_type_id'] = this.eventTypeId;
    data['activity'] = this.activity;
    data['description'] = this.description;
    data['event_date'] = this.eventDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['venue'] = this.venue;
    data['spoc_name'] = this.spocName;
    data['contact'] = this.contact;
    data['attendance_req'] = this.attendanceReq;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}