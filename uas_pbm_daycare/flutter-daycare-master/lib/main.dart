import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/activity_input.dart';
import 'pages/child_input.dart';
import 'pages/child_activities.dart';
import 'pages/login_selection.dart';
import 'pages/caregiver_home.dart';
import 'pages/activity_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Care App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginSelectionPage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/caregiver_home': (context) => const CaregiverHomePage(),
        '/activity_list': (context) => const ActivityListPage(),
        '/caregiver_activity': (context) => const ActivityInputPage(),
        '/home_parent': (context) => const ChildInputPage(),
        '/child_activities': (context) => ChildActivitiesPage(
              childName: ModalRoute.of(context)!.settings.arguments as String,
              childAge: ModalRoute.of(context)!.settings.arguments as int,
            ),
      },
    );
  }
}
