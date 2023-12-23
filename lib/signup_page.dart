// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:project/DialogBox/error_dialog.dart';
import 'package:project/login_page.dart';
import 'package:project/post_screen.dart';
import 'package:project/widgets/global_var.dart';
import 'package:project/widgets/rounded_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String userPhotoUrl = '';

  File? _image;
  bool _isloading = false;

  final signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _getFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    _cropImage(pickedFile!.path);

    Navigator.pop(context);
  }

  void _getFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _cropImage(pickedFile!.path);

    Navigator.pop(context);
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);

    if (croppedImage != null) {
      setState(
        () {
          _image = File(croppedImage.path);
        },
      );
    }
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Please choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  _getFromCamera();
                },
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.camera,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _getFromGallery();
                },
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.image,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void submitFormOnSignUp() async {
    final isValid = signUpFormKey.currentState!.validate();
    if (isValid) {
      if (_image == null) {
        showDialog(
          context: context,
          builder: (context) {
            return const ErrorAlertDialog(
              message: 'Please Pick an Image',
            );
          },
        );
        return;
      }
      setState(
        () {
          _isloading = true;
        },
      );

      try {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim().toLowerCase(),
          password: _passwordController.text.trim(),
        );

        final User? user = _auth.currentUser;
        uid = user!.uid;

        final ref = FirebaseStorage.instance
            .ref()
            .child('userImages')
            .child(uid + '.jpg');
        await ref.putFile(_image!);
        userPhotoUrl = await ref.getDownloadURL();
        FirebaseFirestore.instance.collection('users').doc(uid).set(
          {
            'userName': _nameController.text.trim(),
            'id': uid,
            'userNumber': _phoneController.text.trim(),
            'userEmail': _emailController.text.trim(),
            'userImage': userPhotoUrl,
            'time': DateTime.now(),
            'status': 'approved',
          },
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PostScreen(),
          ),
        );
      } catch (error) {
        setState(
          () {
            _isloading = false;
          },
        );
        ErrorAlertDialog(
          message: error.toString(),
        );
      }
    }

    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SingleChildScrollView(
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
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: signUpFormKey,
                    child: Column(
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                              _showImageDialog();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.green.shade50,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(200),
                              ),
                              child: CircleAvatar(
                                radius: w * 0.10,
                                backgroundColor: Colors.green.shade50,
                                backgroundImage:
                                    _image == null ? null : FileImage(_image!),
                                child: _image == null
                                    ? Transform.scale(
                                        scale:
                                            2, // Adjust the scale factor as needed
                                        child: const Icon(
                                          Icons.camera_enhance,
                                          color: Colors.green,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  RoundedInputField(
                    hintText: 'Name',
                    icon: Icons.person,
                    onChanged: (value) {
                      _nameController.text = value;
                    },
                  ),
                  RoundedInputField(
                    hintText: 'Email',
                    icon: Icons.email,
                    onChanged: (value) {
                      _emailController.text = value;
                    },
                  ),
                  RoundedInputField(
                    hintText: 'Password',
                    icon: Icons.fingerprint_rounded,
                    onChanged: (value) {
                      _passwordController.text = value;
                    },
                  ),
                  RoundedInputField(
                    hintText: 'Phone Number',
                    icon: Icons.phone,
                    onChanged: (value) {
                      _phoneController.text = value;
                    },
                  ),
                  const SizedBox(
                    height: 15,
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
                          submitFormOnSignUp();
                          // if (_formKey.currentState!.validate()) {
                          //   _auth
                          //       .createUserWithEmailAndPassword(
                          //           email: emailController.text.toString(),
                          //           password:
                          //               passwordController.text.toString())
                          //       .then((value) {})
                          //       .onError(
                          //     (error, stackTrace) {
                          //       Utils().toastMessage(error.toString());
                          //     },
                          //   );
                          // }
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
                          'Sign up',
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
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account ",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: const Color.fromARGB(236, 61, 56, 56),
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: "Sign In",
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Continue Sign up with",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 61, 56, 56)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                  )
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
