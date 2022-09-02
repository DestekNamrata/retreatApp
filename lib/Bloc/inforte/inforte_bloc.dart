

import 'package:flutter_app/Bloc/attendanceHistory/attendenceHistory_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/model_boothDetails.dart';
import '../../Models/model_paymentHistory.dart';
import '../../Models/model_votingQues.dart';
import '../../Repository/UserRepository.dart';
import 'inforte_event.dart';
import 'inforte_state.dart';

class EnforteBloc extends Bloc<EnforteEvent, EnforteState> {
  EnforteBloc({this.enforteRepo}) : super(InitialBoothDetailsState());
  final UserRepository? enforteRepo;


  @override
  Stream<EnforteState> mapEventToState(event) async* {


    ///Event for Booting Details List
    if (event is OnLoadingBoothDetailsList) {
      ///Notify loading to UI
      yield BoothDetailsListLoading();

      ///Fetch API via repository
      final BoothDetailsRepo response = await enforteRepo!
          .fetchBoothDetails(userId: event.userid);

      final Iterable refactorProduct = response.data ?? [];
      final punchIn = response.punchIn;
      final boothDetails = refactorProduct.map((item) {
        return BoothDetailsModel.fromJson(item);
      }).toList();
      if(refactorProduct.length>0){
        yield BoothDetailsSuccess(
            boothDetailsList: boothDetails,
                punchIn: punchIn
        );

      }else{
        yield BoothDetailsFail();

      }


    }


    ///Event for Voting Question List
    if (event is OnLoadingVoitingQueList) {
      ///Notify loading to UI
      yield VotingQueListLoading();

      ///Fetch API via repository
      final VotingQueRepo response = await enforteRepo!
          .fetchVotingQue();

      final Iterable refactorProduct = response.data ?? [];
      final votingQues = refactorProduct.map((item) {
        return VotingQueModel.fromJson(item);
      }).toList();
      if(refactorProduct.length>0){
        yield VotingQueSuccess(
            votingQueList: votingQues,
        );

      }else{
        yield VotingQueFail();

      }


    }


  }



}
