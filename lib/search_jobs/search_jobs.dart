// ignore_for_file: unused_import, avoid_print, unused_element, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/job_screen/job_screen.dart';
import 'package:project/post_screen.dart';
import 'package:project/widgets/global_var.dart';
import 'package:project/widgets/listview_widget.dart';
// import 'package:project/widgets/listview_widget.dart';

// ignore: use_key_in_widget_constructors
class SearchJob extends StatefulWidget {
  @override
  State<SearchJob> createState() => _SearchJobState();
}

class _SearchJobState extends State<SearchJob> {
  final TextEditingController _searchQueryController = TextEditingController();
  String searchQuery = '';
  bool _isSearching = false;

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: TextField(
        controller: _searchQueryController,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search Jobs here...',
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        onChanged: (query) => updateSearchQuery(query),
      ),
    );
  }

  updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      print(searchQuery);
    });
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: _startSearch,
      )
    ];
  }

  _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery('');
    });
  }

  _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopSearching),
    );
    setState(() {
      _isSearching = true;
    });
  }

  _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearching = false;
    });
  }

  _buildTitle(BuildContext context) {
    return Text(
      'Search Jobs',
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  _buildBackButton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => JobScreen()));
      },
    );
  }

  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: const Color.fromARGB(217, 34, 163, 57),
          leading: _isSearching ? const BackButton() : _buildBackButton(),
          title: _isSearching ? _buildSearchField() : _buildTitle(context),
          actions: _buildActions(),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('items')
              .where('jobCategory',
                  isGreaterThanOrEqualTo: _searchQueryController.text.trim())
              .where('status', isEqualTo: 'approved')
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
        ));
  }
}
