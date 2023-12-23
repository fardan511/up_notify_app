// ignore_for_file: unused_element, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project/image_slider/image_slider_screen.dart';
import 'package:project/widgets/global_var.dart';

// ignore: must_be_immutable
class ListViewWidget extends StatefulWidget {
  String docId,
      jobEligible,
      img1,
      img2,
      img3,
      img4,
      img5,
      userImg,
      name,
      userId,
      jobCategory,
      postId;
  String jobPrice, jobDescription, address, userNumber;
  DateTime date;
  double lat, lng;

  // ignore: use_key_in_widget_constructors
  ListViewWidget({
    required this.docId,
    required this.jobEligible,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.img4,
    required this.img5,
    required this.userImg,
    required this.name,
    required this.date,
    required this.userId,
    required this.jobCategory,
    required this.postId,
    required this.jobPrice,
    required this.jobDescription,
    required this.lat,
    required this.lng,
    required this.address,
    required this.userNumber,
  });

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState(); //ok
}

class _ListViewWidgetState extends State<ListViewWidget> {
  Future<Future> showDialogForUpdateData(
      selectedDoc,
      oldUserName,
      oldPhoneNumber,
      oldjobPrice,
      oldjobName,
      oldjobEligible,
      oldjobDescription) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text(
              'UPDATE DATA',
              style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: oldUserName,
                  decoration:
                      const InputDecoration(hintText: 'Enter Your Name'),
                  onChanged: (value) {
                    setState(
                      () {
                        oldUserName = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  initialValue: oldPhoneNumber,
                  decoration: const InputDecoration(
                      hintText: 'Enter Your Phone Number'),
                  onChanged: (value) {
                    setState(
                      () {
                        oldPhoneNumber = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  initialValue: oldjobPrice,
                  decoration:
                      const InputDecoration(hintText: 'Enter Your Job Budget'),
                  onChanged: (value) {
                    setState(
                      () {
                        oldjobPrice = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  initialValue: oldjobName,
                  decoration:
                      const InputDecoration(hintText: 'Enter Your Job Title'),
                  onChanged: (value) {
                    setState(
                      () {
                        oldjobName = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  initialValue: oldjobEligible,
                  decoration: const InputDecoration(
                      hintText: 'Enter Your email Address'),
                  onChanged: (value) {
                    setState(
                      () {
                        oldjobEligible = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  initialValue: oldjobDescription,
                  decoration:
                      const InputDecoration(hintText: 'Write Job Description'),
                  onChanged: (value) {
                    setState(
                      () {
                        oldjobDescription = value;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  updateProfileNameOnExistingPosts(oldUserName);
                  _updateUserName(oldUserName, oldPhoneNumber);

                  FirebaseFirestore.instance
                      .collection('items')
                      .doc(selectedDoc)
                      .update({
                    'userName': oldUserName,
                    'userNumber': oldPhoneNumber,
                    'jobPrice': oldjobPrice,
                    'jobCategory': oldjobName,
                    'jobEligible': oldjobEligible,
                    'jobDescription': oldjobDescription,
                  }).catchError((onError) {
                    print(onError);
                  });

                  Fluttertoast.showToast(
                    msg: 'The Job has been Uploaded',
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: Colors.grey,
                    fontSize: 16,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor:
                      Colors.transparent, // Make the ElevatedButton transparent
                  elevation: 0, // Remove the default elevation
                ),
                child: Text(
                  'Update',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  updateProfileNameOnExistingPosts(oldUserName) async {
    await FirebaseFirestore.instance
        .collection('items')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (snapshot) {
        for (int index = 0; index < snapshot.docs.length; index++) {
          String userProfileNameInPost = snapshot.docs[index]['userName'];

          if (userProfileNameInPost != oldUserName) {
            FirebaseFirestore.instance
                .collection('items')
                .doc(snapshot.docs[index].id)
                .update(
              {
                'userName': oldUserName,
              },
            );
          }
        }
      },
    );
  }

  Future _updateUserName(oldUserName, oldPhoneNumber) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        'userName': oldUserName,
        'userNumber': oldPhoneNumber,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 16.0,
        shadowColor: Colors.black12,
        child: Container(
          decoration: const BoxDecoration(
            // color: Colors.grey.shade200,
            color: Color.fromARGB(96, 165, 214, 167),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  //navigator.pushReplacement
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageSliderScreen(
                        title: widget.jobCategory,
                        jobEligible: widget.jobEligible,
                        userNumber: widget.userNumber,
                        jobDescription: widget.jobDescription,
                        lat: widget.lat,
                        lng: widget.lng,
                        address: widget.address,
                        jobPrice: widget.jobPrice,
                        urlImage1: widget.img1,
                        urlImage2: widget.img2,
                        urlImage3: widget.img3,
                        urlImage4: widget.img4,
                        urlImage5: widget.img5,
                      ),
                    ),
                  );
                },
                child: Image.network(
                  widget.img1,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        widget.userImg,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.jobCategory,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          DateFormat('dd MMM, yyyy - hh:mm a')
                              .format(widget.date)
                              .toString(),
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    widget.userId != uid
                        ? const Padding(
                            padding: EdgeInsets.only(right: 50),
                            child: Column(),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialogForUpdateData(
                                    widget.docId,
                                    widget.name,
                                    widget.userNumber,
                                    widget.jobPrice,
                                    widget.jobCategory,
                                    widget.jobEligible,
                                    widget.jobDescription,
                                  );
                                },
                                icon: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.edit_note,
                                    color: Colors.green,
                                    size: 27,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('items')
                                      .doc(widget.postId)
                                      .delete();

                                  Fluttertoast.showToast(
                                    msg: 'Job has been Deleted Successfully',
                                    toastLength: Toast.LENGTH_LONG,
                                    backgroundColor: Colors.grey,
                                    fontSize: 18.0,
                                  );
                                },
                                icon: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.delete_forever,
                                    size: 22,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                            ],
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
