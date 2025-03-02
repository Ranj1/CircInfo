// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
//
// import 'match_list.dart'; // Replace with your main screen
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     // Navigate to the main screen after animation duration
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MatchScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Lottie.asset(
//           'assets/splash_animation.json', // ✅ Lottie animation
//           width: 200,
//           height: 200,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }
