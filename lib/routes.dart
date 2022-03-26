import 'about/about.dart';
import 'quiz/quiz.dart';
import 'home/home.dart';
import 'profile/profile.dart';
import 'signin/signin.dart';
import 'topics/topics.dart';

var appRoutes = {
  '/': (context) =>const HomeScreen(),
  '/signin': (context) => const SignInScreen(),
  '/topics': (context) =>const TopicsScreen(),
  // '/quiz': (context) => const QuizScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
