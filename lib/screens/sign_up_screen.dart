import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final repasswordController = TextEditingController();

  get createUserWithEmailAndPassword => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Welcome to our community.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayMedium,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "\nTo get started, please provide your information and create an account.\n",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displaySmall,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          MyTextfield(
            controller: nameController,
            labelText: "Name",
            obscureText: false,
            hintText: "Enter your name.",
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextfield(
            controller: emailController,
            labelText: "Email",
            obscureText: false,
            hintText: "Enter your email.",
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextfield(
            controller: passwordController,
            labelText: "Password",
            obscureText: true,
            hintText: "Enter your password.",
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextfield(
            controller: repasswordController,
            labelText: "Re-password",
            obscureText: true,
            hintText: "Enter your password again.",
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(onTap: createUserWithEmailAndPassword, hinText: "Sign up"),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Have a member?',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Text(
                  'Sign in.',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
