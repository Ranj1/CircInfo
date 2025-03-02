import 'package:assignment_test/models/countryy_flag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'match_event.dart';
import 'match_state.dart';
import '../repository/match_repository.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final MatchRepository repository;

  MatchBloc({required this.repository}) : super(MatchInitial()) {
    on<FetchAllMatches>(_onFetchAllMatches);
  }

  Future<void> _onFetchAllMatches(FetchAllMatches event, Emitter<MatchState> emit) async {
    emit(MatchLoading());
    try {
      final List<CountryFlag> countryFlags = [
        CountryFlag(country: 'India', flagUrl: '🇮🇳'),
        CountryFlag(country: 'Pakistan', flagUrl: '🇵🇰'),
        CountryFlag(country: 'Australia', flagUrl: '🇦🇺'),
        CountryFlag(country: 'England', flagUrl: '🏴'),
        CountryFlag(country: 'South Africa', flagUrl: '🇿🇦'),
        CountryFlag(country: 'New Zealand', flagUrl: '🇳🇿'),
      ];
      final matchDetails = await repository.fetchAllMatchDetails();
      emit(MatchLoaded(matchDetails: matchDetails,countryFlags:countryFlags ));
    } catch (e) {
      emit(MatchError(error: e.toString()));
    }
  }
}
