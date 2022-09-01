class UnconferenceAgendaResp {
  dynamic success;
  dynamic punchIn;
  dynamic data;

  UnconferenceAgendaResp({this.success, this.data,this.punchIn});

  factory UnconferenceAgendaResp.fromJson(Map<dynamic, dynamic> json) {
    try {
      return UnconferenceAgendaResp(
          success: json['success'],
          data: json['data'],
          punchIn: json['punch_in']

      );
    } catch (error) {
      return UnconferenceAgendaResp(
        data: null,
        punchIn: "",
        success: false,
      );
    }
  }
}

class UnConfAgendaData {
  int? id;
  int? roomId;
  int? referenceId;
  int? eventTypeId;
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

  UnConfAgendaData(
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

  UnConfAgendaData.fromJson(Map<String, dynamic> json) {
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
