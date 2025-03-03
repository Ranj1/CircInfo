import 'package:assignment_test/constant/app_colors.dart';
import 'package:assignment_test/models/countryy_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/match_bloc.dart';
import '../bloc/match_state.dart';
import '../bloc/match_event.dart';
import '../constant/app_dimensions.dart';
import '../constant/app_styles.dart';
import '../models/match_model.dart';
import 'match_details.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    context.read<MatchBloc>().add(FetchAllMatches());

    return Scaffold(
      appBar: AppBar(title: const Text('Matches')),
      body: BlocBuilder<MatchBloc, MatchState>(
        builder: (context, state) {
          if (state is MatchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MatchLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.matchDetails.length,
                itemBuilder: (context, index) {
                  final MatchDetail match = state.matchDetails[index];

                  return buildCard(match,state.countryFlags,context);
                },
              ),
            );
          } else if (state is MatchError) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return Container();
        },
      ),
    );
  }
}

Card buildCard(MatchDetail match,List<CountryFlag> countryFlags,BuildContext context) {
  final teamList = match.teams.values.toList();
  var heading = '${teamList[0].nameFull} vs ${teamList[1].nameFull}';


  final flagMap = { for (var flag in countryFlags) flag.country : flag.flagUrl };


  final flagA = flagMap[teamList[0].nameFull] ?? '';
  final flagB = flagMap[teamList[1].nameFull] ?? '';


  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Column(
            children: [
              ListTile(
                tileColor: AppColors.myColor,
                title: Text(heading,
                  style: AppStyles.primaryTextWhite,
                ),
              ),
              SizedBox(height: AppDimensions.getHeight(context,percentage: 0.02)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TeamScore(teamList[0].nameFull, flagA , match.innings[0].total, "(${match.innings[0].overs})"),
                  TeamScore(teamList[1].nameFull, flagB , "${match.innings[1].total} / ${match.innings[1].wickets}", "(${match.innings[1].overs})"),
                ],
              ),
              SizedBox(height:AppDimensions.getHeight(context,percentage: 0.01)),
              Text(match.matchdetail.result, style: AppStyles.primaryTitleBlack),
              Text(match.matchdetail.series.name, style:AppStyles.secondaryTextGrey ),
            ],
          ),
          SizedBox(height: AppDimensions.getHeight(context,percentage: 0.03)),
          //Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MatchDetailScreen(match: match,countryFlag: countryFlags),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.topCenter, // Align icon to the top center
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12), // Space for the icon
                  padding: EdgeInsets.symmetric(vertical: 18), // Padding inside
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1), // Upper border
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "See More",
                      style: AppStyles.secondaryTextBlack,
                    ),
                  ),
                ),

                // Icon positioned in the middle of the top border
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.keyboard_arrow_down, size: 24, color: Colors.white),
                ),
              ],
            ),
          )

        ],
      )
  );
}

class TeamScore extends StatelessWidget {
  final String teamName, flagPath, score, overs;

  TeamScore(this.teamName, this.flagPath, this.score, this.overs);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(flagPath, style: TextStyle(fontSize: 30)),
        Text(teamName, style: AppStyles.primaryTextBlack),
        Text(score, style: AppStyles.primaryTextBlack),
        Text(overs, style: AppStyles.primaryTextGrey),
      ],
    );
  }
}

