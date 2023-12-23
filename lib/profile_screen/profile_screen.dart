// ignore_for_file: unused_import, use_key_in_widget_constructors, must_be_immutable, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/job_screen/job_screen.dart';
import 'package:project/post_screen.dart';
import 'package:project/widgets/global_var.dart';
import 'package:project/widgets/listview_widget.dart';

class ProfileScreen extends StatefulWidget {
  String sellerId;

  ProfileScreen({required this.sellerId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  _buildBackButton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobScreen(),
          ),
        );
      },
    );
  }

  _buildUserImage() {
    return Container(
      width: 50,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(adUserImageUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  getResult() {
    FirebaseFirestore.instance
        .collection('items')
        .where('id', isEqualTo: widget.sellerId)
        .where('status', isEqualTo: 'approved')
        .get()
        .then((results) {
      setState(() {
        items = results;
        adUserName = items!.docs[0].get('userName');
        adUserImageUrl = items!.docs[0].get('imgPro');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getResult();
  }

  QuerySnapshot? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Scaffold(
        backgroundColor: Colors.green.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: _buildBackButton(),
          title: Row(
            children: [
              _buildUserImage(),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$adUserName post',
                // adUserName,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          flexibleSpace: Container(
            color: Colors.green,
          ),

          elevation: 2,
          // backgroundColor: const Color.fromARGB(217, 34, 163, 57),
          // leading: const Padding(
          //   padding: EdgeInsets.all(8.0),
          // ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('items')
              .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data!.docs.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListViewWidget(
                      docId: snapshot.data!.docs[index].id,
                      jobEligible: snapshot.data!.docs[index]['jobEligible'],
                      img1: snapshot.data!.docs[index]['urlImage1'],
                      img2: snapshot.data!.docs[index]['urlImage2'],
                      img3: snapshot.data!.docs[index]['urlImage3'],
                      img4: snapshot.data!.docs[index]['urlImage4'],
                      img5: snapshot.data!.docs[index]['urlImage5'],
                      userImg: snapshot.data!.docs[index]['imgPro'],
                      name: snapshot.data!.docs[index]['userName'],
                      date: snapshot.data!.docs[index]['time'].toDate(),
                      userId: snapshot.data!.docs[index]['id'],
                      jobCategory: snapshot.data!.docs[index]['jobCategory'],
                      postId: snapshot.data!.docs[index]['postId'],
                      jobPrice: snapshot.data!.docs[index]['jobPrice'],
                      jobDescription: snapshot.data!.docs[index]
                          ['jobDescription'],
                      lat: snapshot.data!.docs[index]['lat'],
                      lng: snapshot.data!.docs[index]['lng'],
                      address: snapshot.data!.docs[index]['address'],
                      userNumber: snapshot.data!.docs[index]['userNumber'],
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('There is no such Job you Created'),
                );
              }
            }
            return const Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
