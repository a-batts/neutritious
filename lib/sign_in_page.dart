import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neutritious/logo.dart';
import 'package:neutritious/menu_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MenuPage()));
      }
    });

    return Scaffold(
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Logo(),
                    const Text("Feed your noodle.",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text("Sign In",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          signInWithGoogle();
                        },
                        style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                        child: Image.asset("asset/sign-in-with-google.png", height: 50))
                  ]))),
    );
  }
}
