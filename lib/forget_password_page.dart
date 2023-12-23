// ignore_for_file: unused_field
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // List images = ['google.png', 'facebook.png', 'twitter.png'];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SingleChildScrollView(
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
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forget Password",
                    style: GoogleFonts.poppins(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Enter Email to reset your password",
                    style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: const Color.fromARGB(255, 61, 56, 56),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
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
                    height: 30,
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(30),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         blurRadius: 10,
                  //         spreadRadius: 7,
                  //         offset: const Offset(1, 1),
                  //         color: Colors.grey.withOpacity(0.4),
                  //       ),
                  //     ],
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 15.0),
                  //     child: TextFormField(
                  //       obscureText: true,
                  //       decoration: InputDecoration(
                  //         hintText: "Password ",
                  //         prefixIcon: const Icon(
                  //           Icons.fingerprint_rounded,
                  //           color: Colors.green,
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30),
                  //           borderSide: const BorderSide(
                  //             color: Colors.white,
                  //             width: 1.0,
                  //           ),
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30),
                  //           borderSide: const BorderSide(
                  //             color: Colors.white,
                  //             width: 1.0,
                  //           ),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(30),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

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
                          auth
                              .sendPasswordResetEmail(
                                  email: emailController.text.toString())
                              .then((value) {
                            Utils().toastMessage(
                                "We have sent you an Email to recover password, \nPlease check your Email");
                          }).onError((error, stackTrace) {
                            Utils().toastMessage(error.toString());
                          });
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
                          'Verify',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: w * 0.05),
                  Center(
                    child: Text(
                      "Continue Sign up with",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 61, 56, 56)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularImageButton(
                        imagePath:
                            'img/google.png', // Replace with your image path
                        onPressed: () {
                          // Handle button 1 press
                        },
                      ),
                      const SizedBox(
                          width: 25.0), // Add some space between buttons
                      CircularImageButton(
                        imagePath:
                            'img/twitter.png', // Replace with your image path
                        onPressed: () {
                          // Handle button 2 press
                        },
                      ),
                      const SizedBox(
                          width: 25.0), // Add some space between buttons
                      CircularImageButton(
                        imagePath:
                            'img/facebook.png', // Replace with your image path
                        onPressed: () {
                          // Handle button 3 press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const CircularImageButton(
      {super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
        // Adjust the button background color as needed
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius:
            BorderRadius.circular(50.0), // Half the width/height of the circle
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            imagePath,
            width: 45.0, // Adjust the image size as needed
            height: 45.0,
          ),
        ),
      ),
    );
  }
}
