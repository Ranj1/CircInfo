import 'package:flutter/material.dart';

import '../models/match_model.dart';

class PlayerPage extends StatefulWidget {
  final MatchDetail match;
  PlayerPage({Key? key, required this.match}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with SingleTickerProviderStateMixin {
  late TabController _scorecardTabController;

  @override
  void initState() {
    super.initState();
    _scorecardTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _scorecardTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> teamKeys = widget.match.teams.keys.toList();
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: TabBar(
              controller: _scorecardTabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.green,
              tabs:  teamKeys.map((key) {
                final team = widget.match.teams[key];
                final nameShort = team?.nameFull;
                return Tab(text: nameShort);
              }).toList(),
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _scorecardTabController,
              children: teamKeys.map((key) {
                final team = widget.match.teams[key]!;

                return _buildTeamPlayersList(team);
              }).toList(),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildTeamPlayersList(Team team) {

    final playersList = team.players.entries.toList();

    return ListView.builder(
      itemCount: playersList.length,
      itemBuilder: (context, index) {
        final entry = playersList[index];
        final playerId = entry.key;
        final playerObj = entry.value;

        final nameFull = playerObj.nameFull;
        final initial = playerObj.nameFull.trim().substring(0, 1);
        final battingStyle = playerObj.batting.style;
        final bowlingStyle = playerObj.bowling.style;
        final isCaptain = playerObj.iscaptain == true;
        final isKeeper = playerObj.iskeeper == true;

        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(playerObj.nameFull),
                  content: Text(
                      'Batting Style: ${playerObj.batting.style}\n'
                          'Bowling Style: ${playerObj.bowling.style}\n'
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            leading: CircleAvatar(child: Text(initial)),
            title: Text(nameFull),
            subtitle: Text(
              'Batting: $battingStyle | Bowling: $bowlingStyle'
                  '${isCaptain ? " (C)" : ""}'
                  '${isKeeper ? " (Wk)" : ""}',
            ),
          ),
        );
      },
    );
  }
}