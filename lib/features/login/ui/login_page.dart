import 'package:animate_do/animate_do.dart';
import 'package:carhelp/features/login/ui/pop_up_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginAccount(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        PopUpSnackbar(snackContent: 'Please fill all the fields!'),
      );
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email, password: password);
        debugPrint('User signed in');
        if (userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.popUntil(context, (route) => route.isFirst);
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacementNamed('/home');
        }
      } on FirebaseAuthException catch (ex) {
        debugPrint(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          child: const Icon(
            Icons.highlight_off,
            size: 20,
          ),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          'Log In',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          //Navigate to Sign In
          FadeInDown(
            delay: const Duration(milliseconds: 1200),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?', style: TextStyle(fontWeight: FontWeight.w500),),
                CupertinoButton(
                    child: Text(
                      'Sign In!',
                      style: TextStyle(color: Colors.green.shade700,),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signin');
                    })
              ],
            ),
          ),
          //Banner
          FadeInDown(
            delay: const Duration(milliseconds: 300),
            child: Container(
              height: MediaQuery.of(context).size.height / 3.5,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade900,
              ),
            ),
          ),
          //SignInElements
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: SignInFieldRows(
              fieldName: 'E-mail',
              fieldValue: 'Enter your mail',
              controller: emailController,
              obscureTextBool: false,
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 600),
            child: SignInFieldRows(
              fieldName: 'Password',
              fieldValue: 'Enter password',
              controller: passwordController,
              obscureTextBool: true,
            ),
          ),
          
          //SubmitButton
          FadeInUp(
            delay: const Duration(milliseconds: 1200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: CupertinoButton(
                    onPressed: () {
                      emailController.clear();
                      passwordController.clear();
                    },
                    child: Icon(
                      Icons.cancel_presentation_rounded,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 30),
                  child: CupertinoButton(
                    onPressed: () {
                      loginAccount(context);
                    },
                    child: Icon(
                      Icons.check,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SignInFieldRows extends StatelessWidget {
  String fieldName = "";
  String fieldValue = "";
  bool obscureTextBool;
  TextEditingController controller;
  SignInFieldRows(
      {super.key,
      required this.fieldName,
      required this.fieldValue,
      required this.controller,
      required this.obscureTextBool});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                fieldName,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  obscureText: obscureTextBool,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: fieldValue,
                    hintStyle: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            color: theme.colorScheme.tertiary,
            height: 1,
          ),
        ],
      ),
    );
  }
}
