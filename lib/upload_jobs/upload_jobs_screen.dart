// ignore_for_file: prefer_const_constructors, library_prefixes, avoid_print

import 'dart:io';
// ignore: unused_import
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:project/DialogBox/loading_dialog.dart';
import 'package:project/job_screen/job_screen.dart';
// import 'package:project/search_jobs/search_jobs.dart';
import 'package:project/widgets/global_var.dart';
import 'package:uuid/uuid.dart';

// ignore: use_key_in_widget_constructors
class UploadJobsScreen extends StatefulWidget {
  @override
  State<UploadJobsScreen> createState() => _UploadJobsScreenState();
}

class _UploadJobsScreenState extends State<UploadJobsScreen> {
  String postId = Uuid().v4();
  bool uploading = false, next = false;
  final List<File> _image = [];
  List<String> urlsList = [];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String name = '';
  String phoneNo = '';
  double val = 0;

  String jobPrice = "";
  String jobCategory = "";
  String jobEligible = "";
  String jobDescription = "";

  chooseImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(
      () {
        _image.add(
          File(pickedFile!.path),
        );
      },
    );
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(
        () {
          val = i / _image.length;
        },
      );

      var ref = FirebaseStorage.instance
          .ref()
          .child('image/${Path.basename(img.path)}');

      await ref.putFile(img).whenComplete(
        () async {
          await ref.getDownloadURL().then(
            (value) {
              urlsList.add(value);
              i++;
            },
          );
        },
      );
    }
  }

  getNameOfUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!['userName'];
          phoneNo = snapshot.data()!['userNumber'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getNameOfUser();
    // imgRef = FirebaseFirestore.instance.collection('imageUrls');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 77, 156, 81),
          automaticallyImplyLeading: false,
          leading: const Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          title: Text(
            next ? "Please Write Job Information" : "Choose Jobs Images",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          actions: [
            next
                ? Container()
                : ElevatedButton(
                    onPressed: () {
                      if (_image.length == 5) {
                        setState(
                          () {
                            uploading = true;
                            next = true;
                          },
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Please Select fives images to proceed',
                            gravity: ToastGravity.BOTTOM);
                      }
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.green.shade50),
          child: next
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          decoration:
                              InputDecoration(hintText: 'Enter Job Budget'),
                          onChanged: (value) {
                            jobPrice = value;
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          decoration:
                              InputDecoration(hintText: 'Enter Job Details'),
                          onChanged: (value) {
                            jobCategory = value;
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter your email Address'),
                          onChanged: (value) {
                            jobEligible = value;
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Write breif Job Description'),
                          onChanged: (value) {
                            jobDescription = value;
                          },
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Center(
                          child: Container(
                            width: 180,
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
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return LoadingAlertDialog(
                                      message: 'Uploading...',
                                    );
                                  },
                                );
                                uploadFile().whenComplete(
                                  () {
                                    FirebaseFirestore.instance
                                        .collection('items')
                                        .doc(postId)
                                        .set(
                                      {
                                        'userName': name,
                                        'id': _auth.currentUser!.uid,
                                        'postId': postId,
                                        'userNumber': phoneNo,
                                        'jobPrice': jobPrice,
                                        'jobCategory': jobCategory,
                                        'jobEligible': jobEligible,
                                        'jobDescription': jobDescription,
                                        'urlImage1': urlsList[0].toString(),
                                        'urlImage2': urlsList[1].toString(),
                                        'urlImage3': urlsList[2].toString(),
                                        'urlImage4': urlsList[3].toString(),
                                        'urlImage5': urlsList[4].toString(),
                                        'imgPro': userImageUrl,
                                        'lat': position!.latitude,
                                        'lng': position!.longitude,
                                        'address': completeAddress,
                                        'time': DateTime.now(),
                                        'status': 'approved'
                                      },
                                    );
                                    Fluttertoast.showToast(
                                      msg: 'Data Added Successfully',
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JobScreen(),
                                      ),
                                    );
                                  },
                                ).catchError(
                                  (onError) {
                                    print(onError);
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Text(
                                'Upload Job',
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: GridView.builder(
                        itemCount: _image.length + 1,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return index == 0
                              ? Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width:
                                                60, // Adjust the width and height as needed
                                            height: 60,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors
                                                  .green, // Replace with your desired background color
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.add,
                                                color: Colors.white),
                                            onPressed: () {
                                              !uploading ? chooseImage() : null;
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                        _image[index - 1],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                    uploading
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Uploading... wait for a minute",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                CircularProgressIndicator(
                                  value: val,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
        ),
      ),
    );
  }
}
