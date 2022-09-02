import 'package:flutter_app/Models/model_paymentHistory.dart';
import 'package:meta/meta.dart';

import '../../Models/model_VotingAnswer.dart';
import '../../Models/model_boothDetails.dart';
import '../../Models/model_votingQues.dart';

@immutable
abstract class EnforteState {}

class InitialBoothDetailsState extends EnforteState {}

class BoothDetailsListLoading extends EnforteState {}


class BoothDetailsSuccess extends EnforteState {
  List<BoothDetailsModel>? boothDetailsList;
  String? punchIn;
  BoothDetailsSuccess({this.boothDetailsList,this.punchIn});

}

class BoothDetailsFail extends EnforteState {}


class VotingQueListLoading extends EnforteState {}



class VotingQueSuccess extends EnforteState {
  List<VotingQueModel>? votingQueList;
  VotingQueSuccess({this.votingQueList,});

}

class VotingQueFail extends EnforteState {}


class VotingAnsSuccess extends EnforteState {
  List<VotingAnsModel>? votingAnsList;
  VotingAnsSuccess({this.votingAnsList,});

}

class VotingAnsFail extends EnforteState {}
