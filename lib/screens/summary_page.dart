import 'package:flutter/material.dart';
class SummaryPage extends StatelessWidget {
  // The "Notes" data from your JSON as a Map
  final Map<String, List<String>> notes;

  const SummaryPage({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We assume the notes map has keys "1" and "2"
    return DefaultTabController(
      length: 2, // Two tabs for the two notes lists
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
            // Tab for key "1"
            _buildNotesList(notes["1"] ?? []),
            // Tab for key "2"
            _buildNotesList(notes["2"] ?? []),
          ],
        ),
      ),
    );

  }

  /// Builds a scrollable list of note strings with a divider between them.
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