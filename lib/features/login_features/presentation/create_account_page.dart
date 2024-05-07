import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  // TODO: Styling: -Customize the appearance
  // TODO: Error handling - Display informative error messages to the user.
  // TODO: Backend integration - Implement the actual account creation logic by connecting to your backend service.
  // TODO: Password strength - Add password strength checking.

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double smallSpacer = constraints.maxHeight * 0.01;
            double mediumSpacer = constraints.maxHeight * 0.03;
            double headerHeight = constraints.maxHeight * 0.20;
            double footerHeight = constraints.maxHeight * 0.20;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: headerHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logo!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: smallSpacer),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Create Account")
                      ),
                      SizedBox(height: smallSpacer),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Confirm Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: mediumSpacer),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // TODO: Submit data to backend for account creation
                                  print('Creating account with email: ${_emailController.text}');
                                }
                              },
                              child: const Text('Create Account'),
                            ),
                            SizedBox(height: smallSpacer),
                            RichText(
                              text: TextSpan(
                                text: 'Already have an account?',
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Sign in',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // TODO: Go to login Page
                                      },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: footerHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
      );
  }
}