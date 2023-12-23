// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/profile_screen/profile_screen.dart';
import 'package:project/search_jobs/search_jobs.dart';
import 'package:project/upload_jobs/upload_jobs_screen.dart';
import 'package:project/widgets/global_var.dart';
import 'package:project/widgets/listview_widget.dart';

class JobScreen extends StatefulWidget {
  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  // FirebaseAuth _auth = FirebaseAuth.instance ;
  getMyData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((results) {
      setState(() {
        userImageUrl = results.data()!['userImage'];
        getUserName = results.data()!['userName'];
      });
    });
  }

  getUserAddress() async {
    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    position = newPosition;
    placemarks = await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );

    Placemark placemark = placemarks![0];

    String newCompleteAddress =
        '${placemark.subThoroughfare} ${placemark.thoroughfare},'
        '${placemark.subThoroughfare} ${placemark.locality},'
        '${placemark.subAdministrativeArea},'
        '${placemark.administrativeArea} ${placemark.postalCode},'
        '${placemark.country},';

    completeAddress = newCompleteAddress;
    // ignore: avoid_print
    print(completeAddress);

    return completeAddress;
  }

  @override
  void initState() {
    super.initState();
    getUserAddress();
    uid = FirebaseAuth.instance.currentUser!.uid;
    userEmail = FirebaseAuth.instance.currentUser!.email!;
    getMyData();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Scaffold(
        backgroundColor: Colors.green.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      sellerId: uid,
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchJob(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 77, 156, 81),
          title: Text(
            'Jobify Jobs',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          // centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('items')
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
                  child: Text('There is No Job'),
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
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Jobs',
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UploadJobsScreen()));
          },
          child: const Icon(Icons.cloud_upload),
        ),
      ),
    );
  }
}
