import 'package:assignment_test/screens/player_page.dart';
import 'package:assignment_test/screens/summary_page.dart';
import 'package:flutter/material.dart';
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
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.green,
                tabs: const [
                  Tab(text: 'SUMMARY'),
                  Tab(text: 'Player'),
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
    // Example: Using the match details
    final matchDetail = widget.match.matchdetail; // top-level detail
    final innings = widget.match.innings;         // list of innings

    // Safety checks in case we have fewer than 2 innings
    final firstInnings = innings.isNotEmpty ? innings[0] : null;
    final secondInnings = innings.length > 1 ? innings[1] : null;

    // Example scoreboard data
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
            // Top line: e.g. "ICC Champions Trophy" + "Sun, 23 Feb"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ICC Champions Trophy', // or matchDetail.series.name
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  matchDetail.match.date, // e.g. "Sun, 23 Feb"
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Team row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // First Team column
                Column(
                  children: [
                    Text(
                      flagA,
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$firstTeamRuns ($firstTeamOvers)',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      teamList[0].nameFull,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                // Second Team column
                Column(
                  children: [
                    Text(
                      flagB,
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$secondTeamRuns/$secondTeamWickets ($secondTeamOvers)',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      teamList[1].nameFull,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Match result line
            Text(
              matchDetail.result, // e.g. "IND won by 6 wickets (45 balls left)"
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),

            // Extra info line
            Text(
              matchDetail.series.name, // e.g. "Group stage - ODI 5 of 15"
              style: const TextStyle(color: Colors.grey),
            ),
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
      // Number of items
      itemCount: widget.match.nuggets.length,
      // A divider or spacing between each item
      separatorBuilder: (context, index) => const Divider(height: 1),
      // Build each item
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





