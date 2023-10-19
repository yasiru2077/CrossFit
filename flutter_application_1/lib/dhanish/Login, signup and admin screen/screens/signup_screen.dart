import 'package:flutter/material.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/custom_textfield.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/screens/login_screen.dart';
import 'package:flutter_application_1/dhanish/Login, signup and admin screen/services/auth_services.dart';

enum Options { coach, member }

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final AuthService authService = AuthService();

  void signupUser() {
    authService.signUpUser(
        context: context,
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        usertype: opt == Options.coach ? 'coach' : 'member');
  }

  Options opt = Options.coach;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              
              children: <TextSpan>[
                TextSpan(text: 'Cross', style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: 'Fit',
                    style: TextStyle(color: Color.fromRGBO(252, 176, 64, 1))),
              ],
            ),
          ),

          const Text(
            "SignUp",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: nameController,
              hintText: 'Enter your name',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: passwordController,
              hintText: 'Enter your password',
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Color.fromARGB(255, 214, 177, 135),
                  ),
                  child: Radio(
                    value: Options.coach,
                    groupValue: opt,
                    onChanged: (value) {
                      setState(() {
                        opt = value as Options;
                      });
                    },
                    activeColor: Color.fromARGB(255, 214, 177, 135),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Coach',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                      unselectedWidgetColor:
                          Color.fromARGB(255, 214, 177, 135)),
                  child: Radio(
                    value: Options.member,
                    groupValue: opt,
                    onChanged: (value) {
                      setState(() {
                        opt = value as Options;
                      });
                    },
                    activeColor: Color.fromARGB(255, 214, 177, 135),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Member',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: signupUser,
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(148, 28, 82, 133),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 80,
                ),
                
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                    )),
            child: const Text(
              "Sign up",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(148, 28, 82, 133),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 70,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
