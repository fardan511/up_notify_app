import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/forget_password_page.dart';
import 'package:project/post_screen.dart';
import 'package:project/signup_page.dart';
import 'package:project/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  // bool obsecureText = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    _auth
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text.toString(),
    )
        .then(
      (value) {
        Utils().toastMessage(
          value.user!.email.toString(),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PostScreen(),
          ),
        );
      },
    ).onError(
      (error, stackTrace) {
        debugPrint(
          error.toString(),
        );
        Utils().toastMessage(
          error.toString(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Exit App'),
                content: const Text('Are you sure you want to exit the app?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: SingleChildScrollView(
          // Wrap Column with SingleChildScrollView
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  width: w,
                  height: h * 0.24,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/logoMain.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0),
                width: w,
                height: h * 0.15,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/logoLine.png'), fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //      color: Color.fromARGB(236, 61, 56, 56),
                      "Hello",
                      style: GoogleFonts.poppins(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign into your account",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: const Color.fromARGB(236, 61, 56, 56),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Email ",
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.green,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return 'Enter email';
                                //   }

                                //   return null;
                                // },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 7,
                                  offset: const Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password ",
                                  prefixIcon: const Icon(
                                    Icons.fingerprint_rounded,
                                    color: Colors.green,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(161, 24, 146, 54),
                              Color.fromARGB(217, 34, 163, 57),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Colors
                                .transparent, // Make the ElevatedButton transparent
                            elevation: 0, // Remove the default elevation
                          ),
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Forget Password?",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: const Color.fromARGB(236, 61, 56, 56),
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign
                                  .center, // Center the text horizontally.
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "---------------------OR---------------------",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color.fromARGB(199, 68, 67, 67)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Create new ",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: const Color.fromARGB(236, 61, 56, 56),
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: "Up-Notify Account",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: const Color.fromARGB(236, 61, 56, 56),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
