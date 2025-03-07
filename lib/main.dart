import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:chat_app/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MessageMe app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: ChatScreen(),
        initialRoute: _auth.currentUser != null ? ChatScreen.screenRoute : WelcomeScreen.screenRoute,
        routes: {
          WelcomeScreen.screenRoute: (context) => const WelcomeScreen(),
          SignInScreen.screenRoute: (context) => const SignInScreen(),
          RegistrationScreen.screenRoute: (context) => const RegistrationScreen(),
          ChatScreen.screenRoute: (context) => const ChatScreen(),
        });
  }
}
