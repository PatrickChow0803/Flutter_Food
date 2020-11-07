import 'package:flutter/material.dart';
import 'package:flutter_food/src/helpers/screen_navigation.dart';
import 'package:flutter_food/src/helpers/style.dart';
import 'package:flutter_food/src/providers/auth.dart';
import 'package:flutter_food/src/screens/registration.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';
import 'package:flutter_food/src/widgets/loading.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // key is used to check the state of the scaffold widget
  // This is used to show a snackbar for a failed login
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return authProvider.status == Status.Authenticating
        ? Loading()
        : Scaffold(
            key: _key,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset(
                  'images/lg.png',
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        controller: authProvider.email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        controller: authProvider.password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () async {
                      // If signIn() is NOT true, prevent the button from working.
                      // Remember that signIn() returns a bool value
                      // await is needed to use signIn()
                      if (!await authProvider.signIn()) {
                        _key.currentState.showSnackBar(SnackBar(content: Text('Login Failed')));
                        return;
                      }
                      // If login is successful, continue to the next screen
                      authProvider.cleanControllers();
                      changeScreenReplacement(context, Home());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: red,
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Login',
                              size: 24,
                              colors: white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    changeScreen(context, Registration());
                  },
                  child: CustomText(
                    text: 'Register Here',
                    size: 16,
                  ),
                )
              ],
            ),
          );
  }
}
