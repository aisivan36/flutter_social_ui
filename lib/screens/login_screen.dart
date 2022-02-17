import 'package:flutter/material.dart';

import '../widgets/curve_clipper.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoginTapped = false;
  bool isSignupTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(flip: true, reverse: false),
                child: Image(
                  image: const AssetImage('assets/images/login_background.jpg'),
                  height: MediaQuery.of(context).size.height / 2.5,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Text(
                'LOGIN SCREEN',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 10.3),
              ),
              const SizedBox(height: 10.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              GestureDetector(
                onTap: () {
                  print('Tapped');
                  isLoginTapped = true;
                  setState(() {});
                  Future.delayed(
                    const Duration(seconds: 2),
                    () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        )),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 61.0),
                  height: 47.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: isLoginTapped
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                        ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                    height: 80.0,
                    child: isSignupTapped
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                print('tapped signup');
                                isSignupTapped = true;
                              });
                            },
                            child: const Text(
                              "Don't have an account? Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
