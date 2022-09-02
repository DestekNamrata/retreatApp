

import 'package:flutter_app/Bloc/attendanceHistory/attendenceHistory_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/model_paymentHistory.dart';
import '../../Repository/UserRepository.dart';
import 'attendenceHistory_event.dart';

class AttendenceHistoryBloc extends Bloc<AttendanceHistoryEvent, AttendanceHistoryState> {
  AttendenceHistoryBloc({this.attendenceHistoryRepo}) : super(InitialAttendanceHistoryState());
  final UserRepository? attendenceHistoryRepo;


  @override
  Stream<AttendanceHistoryState> mapEventToState(event) async* {


    ///Event for AttendenceHistory
    if (event is OnLoadingAttendanceHistoryList) {
      ///Notify loading to UI
      yield AttendanceHistoryListLoading();

      ///Fetch API via repository
      final AttendanceHistoryRepo response = await attendenceHistoryRepo!
          .fetchAttendanceHistory(
        userId: event.userid,
      );

      final Iterable refactorProduct = response.data ?? [];
      final attendenceHistory = refactorProduct.map((item) {
        return AttendanceHistoryModel.fromJson(item);
      }).toList();
      if(refactorProduct.length>0){
        yield AttendanceHistorySuccess(
          attendenceHistoryList: attendenceHistory
        );

      }else{
        yield AttendanceHistoryFail();

      }


    }

  }



}
