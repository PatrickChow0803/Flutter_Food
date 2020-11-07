import 'package:flutter/material.dart';
import 'package:flutter_food/src/providers/auth.dart';
import 'package:flutter_food/src/screens/home.dart';
import 'package:flutter_food/src/screens/login.dart';
import 'package:flutter_food/src/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  // Just for safety reasons.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Tells the app what providers that I'm going to use throughout the application
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food App',
          theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ScreensController()),
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}
