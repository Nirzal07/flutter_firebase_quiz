import 'package:flutter/material.dart';
import 'package:myapp/signin/signin.dart';
import 'package:myapp/topics/topics.dart';
import 'package:myapp/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        } else if (snapshot.hasError) {
          return const Text('Error');
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const SignInScreen();
        }
      },
    );
  }
}
