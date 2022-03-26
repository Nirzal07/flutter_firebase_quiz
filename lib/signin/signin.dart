import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/services/auth.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(
            size: 150,
          ),
          Flexible(child: LoginButton(
            color: Colors.deepPurple,
            icon: FontAwesomeIcons.userNinja,
            text: 'Continue as Guest',
            loginMethod: AuthService().anonSignin
          ),
          ),
          LoginButton(
            color: Colors.blue,
            icon: FontAwesomeIcons.google,
            text: "Sign in with google",
            loginMethod: AuthService().signInWithGoogle,
            )
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.loginMethod,
    }) 
    
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton.icon(
        onPressed: () => loginMethod(),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
          ),
          label: const Text('Login')
          )
    );
  }
}
