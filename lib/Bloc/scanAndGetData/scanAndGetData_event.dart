abstract class ScanAndGetDataEvent {}

class OnScanQrCode extends ScanAndGetDataEvent {
  String? attendanceType,room_no;
  OnScanQrCode({this.attendanceType,this.room_no});

}

class OnGetAttendanceData extends ScanAndGetDataEvent {
  String? attendanceType,room_no;
  OnGetAttendanceData({this.attendanceType,this.room_no});

}



