import 'package:meta/meta.dart';

@immutable
abstract class EnforteEvent {}


class OnLoadingBoothDetailsList extends EnforteEvent {
  String userid;

  OnLoadingBoothDetailsList({required this.userid});
}

class OnLoadingVoitingQueList extends EnforteEvent {

  OnLoadingVoitingQueList();
}

class OnLoadingVotingAnsList extends EnforteEvent {

  OnLoadingVotingAnsList();
}
