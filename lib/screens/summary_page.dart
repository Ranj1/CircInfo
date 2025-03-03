import 'package:flutter/material.dart';
class SummaryPage extends StatelessWidget {
  final Map<String, List<String>> notes;

  const SummaryPage({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const TabBar(
            tabs: [
              Tab(text: "Team 1"),
              Tab(text: "Team 2"),
            ],
          ),
        ),
        body: TabBarView(
          children: [

            _buildNotesList(notes["1"] ?? []),

            _buildNotesList(notes["2"] ?? []),
          ],
        ),
      ),
    );

  }


  Widget _buildNotesList(List<String> notesList) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: notesList.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final note = notesList[index];
        return ListTile(
          leading: const Icon(Icons.sports_cricket, color: Colors.green),
          title: Text(
            note,
            style: const TextStyle(fontSize: 14),
          ),
        );
      },
    );
  }
}