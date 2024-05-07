import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;

  void _toggleTextVisibility(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double smallSpacer = constraints.maxHeight * 0.01;
            double headerHeight = constraints.maxHeight * 0.20;
            double signInInformationsHeight = constraints.maxHeight * 0.60;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: headerHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: smallSpacer),
                    Text(
                      'A Couple Tasks',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ),

              Container(
                height: signInInformationsHeight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        ),
                      ),
                    FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                ),
                              ),
                              TextField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                                    onPressed: _toggleTextVisibility,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Forgot Password?');
                                      },
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Log In'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Divider(
                                color: Colors.black,
                                height: 20,
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                              ),
                              ),
                              Text('Or'),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  height: 20,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.g_mobiledata_rounded),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.facebook),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          );
          },
        ),
      ),
    );
  }
}