import 'package:assignment_test/models/countryy_flag.dart';

import '../models/match_model.dart';

abstract class MatchState {}

class MatchInitial extends MatchState {}

class MatchLoading extends MatchState {}

class MatchLoaded extends MatchState {
  final List<MatchDetail> matchDetails;
  final List<CountryFlag> countryFlags;
  MatchLoaded({required this.matchDetails,required this.countryFlags});
}

class MatchError extends MatchState {
  final String error;
  MatchError({required this.error});
}
