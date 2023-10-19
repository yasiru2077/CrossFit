import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../services/auth_services.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService authService = AuthService();
  var auth;
  @override
  void initState() {
    authService.getUserData(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      auth = Provider.of<UserProvider>(context, listen: false).user;

      if (auth.id == '') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignupScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
