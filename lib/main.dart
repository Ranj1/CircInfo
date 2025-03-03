// lib/main.dart
import 'package:assignment_test/screens/match_list.dart';
import 'package:assignment_test/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repository/match_repository.dart';
import 'bloc/match_bloc.dart';


void main() {
  final MatchRepository repository = MatchRepository();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final MatchRepository repository;
  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Match Details',
      // home: BlocProvider(
      //   create: (_) => MatchBloc(repository: repository),
      //   child: const MatchListScreen(),
      // ),
      home: SplashScreen(repository: repository),
    );
  }
}
