import 'package:assignment_test/screens/player_page.dart';
import 'package:assignment_test/screens/summary_page.dart';
import 'package:flutter/material.dart';
import '../constant/app_dimensions.dart';
import '../models/match_model.dart';
import '../models/countryy_flag.dart';

class MatchDetailScreen extends StatefulWidget {
  final MatchDetail match;
  final List<CountryFlag> countryFlag;

  const MatchDetailScreen({Key? key, required this.match, required this.countryFlag,}) : super(key: key);

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final teamList = widget.match.teams.values.toList();

    final heading = '${teamList[0].nameFull} vs ${teamList[1].nameFull}';
    final Map<String, String> flagMap = {
      for (var flag in widget.countryFlag) flag.country: flag.flagUrl,
    };

    final flagA = flagMap[teamList[0].nameFull] ?? '';
    final flagB = flagMap[teamList[1].nameFull] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            _buildScoreboardCard(teamList, flagA, flagB),

            Container(
              color: Colors.grey[200],
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.green,

                tabAlignment: TabAlignment.start,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.only(left:20.0),
                tabs: const [
                  Tab(text: 'SUMMARY'),
                  Tab(text: 'PLAYER'),
                  Tab(text: 'COMMENTARY'),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SummaryPage(notes: widget.match.notes,),
                  PlayerPage(match:widget.match ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                      child: _buildCommentaryTab()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreboardCard(List<Team> teamList, String flagA, String flagB) {
    final matchDetail = widget.match.matchdetail; // top-level detail
    final innings = widget.match.innings;         // list of innings

    final firstInnings = innings.isNotEmpty ? innings[0] : null;
    final secondInnings = innings.length > 1 ? innings[1] : null;

    final firstTeamRuns = firstInnings?.total ?? '';
    final firstTeamOvers = firstInnings?.overs ?? '';
    final secondTeamRuns = secondInnings?.total ?? '';
    final secondTeamWickets = secondInnings?.wickets ?? '';
    final secondTeamOvers = secondInnings?.overs ?? '';

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  matchDetail.series.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  matchDetail.match.date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.getHeight(context,percentage: 0.01)),

            // Team row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Column(
                  children: [
                    Text(
                      flagA,
                      style: const TextStyle(fontSize: 40),
                    ),
                    SizedBox(height: AppDimensions.getHeight(context,percentage: 0.01)),
                    Text(
                      '$firstTeamRuns ($firstTeamOvers)',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(context,percentage: 0.01)),
                    Text(
                      teamList[0].nameFull,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      flagB,
                      style: const TextStyle(fontSize: 40),
                    ),
                    SizedBox(height: AppDimensions.getHeight(context,percentage: 0.01)),
                    Text(
                      '$secondTeamRuns/$secondTeamWickets ($secondTeamOvers)',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppDimensions.getHeight(context,percentage: 0.01)),
                    Text(
                      teamList[1].nameFull,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppDimensions.getHeight(context,percentage: 0.01)),

            Text(matchDetail.result, style: const TextStyle(fontWeight: FontWeight.w600),),
             SizedBox(height: AppDimensions.getHeight(context,percentage: 0.01)),
            Text(matchDetail.series.name, style: const TextStyle(color: Colors.grey),),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentaryTab() {
    if (widget.match.nuggets.isEmpty) {
      return const Center(child: Text('No commentary available.'));
    }
    return ListView.separated(

      itemCount: widget.match.nuggets.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final nugget = widget.match.nuggets[index];
        return ListTile(
          leading: const Icon(Icons.sports_cricket, color: Colors.green),
          title: Text(
            nugget,
            style: const TextStyle(fontSize: 14),
          ),
        );
      },
    );
  }

}





