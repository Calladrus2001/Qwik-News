import 'package:comet_labs_task/Utils/colors.dart';
import 'package:comet_labs_task/Views/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool hasAccount = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeView();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.27,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 65),
                              Image.asset(
                                'assets/images/auth_graphic.png',
                                height: 250,
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("Code:Aegis",
                        style: TextStyle(
                            color: primaryAccent, letterSpacing: 3, fontSize: 24)),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Enter your email',
                                  hintText: 'ex: test@gmail.com',
                                ),
                                onChanged: (value) {
                                  _email = value;
                                },
                                validator: (value) {}),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: passController,
                              decoration: const InputDecoration(
                                labelText: 'Enter your password',
                              ),
                              obscureText: true,
                              onChanged: (value) {
                                _password = value;
                              },
                              validator: (value) {},
                            ),
                            const SizedBox(height: 36),

                            /// login/register button

                            Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: GestureDetector(
                                  child: Container(
                                    height: 55,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: primaryAccent,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Center(
                                        child: hasAccount
                                            ? const Text(
                                          "Register",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight:
                                              FontWeight.w500),
                                        )
                                            : const Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight:
                                              FontWeight.w500),
                                        )),
                                  ),
                                  onTap: () {
                                    if (hasAccount) {
                                      SignUp(_email, _password);
                                    } else {
                                      SignIn(_email, _password);
                                    }
                                    emailController.text = "";
                                    passController.text = "";
                                  },
                                )),

                            /// login/register button ends
                            const SizedBox(height: 64),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                hasAccount
                                    ? const Text("Already have an account?  ",
                                    style: TextStyle(color: Colors.grey))
                                    : const Text("Don't have an account?  ",
                                    style: TextStyle(color: Colors.grey)),
                                GestureDetector(
                                    child: hasAccount
                                        ? Text("Login",
                                        style: TextStyle(color: primaryAccent))
                                        : Text("Register",
                                        style: TextStyle(color: primaryAccent)),
                                    onTap: () {
                                      setState(() {
                                        hasAccount = !hasAccount;
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }

  Future SignIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future SignUp(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}