// ignore_for_file: unused_import, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/chat_screen.dart';
import 'package:project/job_screen/job_screen.dart';
import 'package:project/login_page.dart';
import 'package:project/profile_screen/profile_screen.dart';
import 'package:project/search_jobs/search_jobs.dart';
import 'package:project/success_stories/success_stories.dart';
import 'package:project/support/support.dart';
import 'package:project/upload_jobs/upload_jobs_screen.dart';
import 'package:project/upwork_listing/upwork_listing.dart';
import 'package:project/user_screen/user_screen.dart';
import 'package:project/utils/utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/widgets/global_var.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

final myitems = [
  Image.asset("img/jobSearch.png"),
  Image.asset("img/jobsAlerts.png"),
  Image.asset("img/coverLetterGenerator.png"),
  Image.asset("img/ai.png"),
];

int activeIndex = 0;

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

_buildUserImage() {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(adUserImageUrl),
        fit: BoxFit.fill,
      ),
    ),
  );
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  // ignore: unused_field, prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
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
          )
        ],
        backgroundColor: const Color.fromARGB(255, 77, 156, 81),
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        // centerTitle: true,
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Color.fromARGB(255, 45, 130, 48),
      //         ),
      //         child: Text(
      //           'Drawer Header',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Drawer Item 1'),
      //         onTap: () {
      //           // Handle drawer item 1 tap
      //           Navigator.pop(context); // Close the drawer
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Drawer Item 2'),
      //         onTap: () {
      //           // Handle drawer item 2 tap
      //           Navigator.pop(context); // Close the drawer
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      backgroundColor: Colors.green.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 10, 0),
              child: Row(
                children: [
                  Text(
                    'Welcome $adUserName',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 45, 130, 48),
                    ),
                  ),
                  const Spacer(),
                  _buildUserImage(),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 250,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            activeIndex = index;
                          },
                        );
                      },
                    ),
                    items: myitems,
                  ),
                ),
                buildIndicator(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: w * 0.8,
              height: h * 0.17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UpworkJobs(),
                            ),
                          );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15.0),
                          elevation: 8.0,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                'img/upwork.svg',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Upwork\nJobs",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 61, 56, 56),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobScreen(),
                            ),
                          );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15.0),
                          elevation: 8.0,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                'img/jobSearch.svg',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Jobs\nSearch",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 61, 56, 56),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UploadJobsScreen(),
                            ),
                          );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15.0),
                          elevation: 8.0,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                'img/upload_jobs.svg',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Jobs\nUpload",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 61, 56, 56),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: w * 0.8,
              height: h * 0.17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatScreen(),
                            ),
                          );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15.0),
                          elevation: 8.0,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                'img/coverLetterGenerator.svg',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "AI\nHelper",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 61, 56, 56),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => UploadJobsScreen(),
                          //   ),
                          // );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15.0),
                          elevation: 8.0,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                'img/chrome.svg',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Up-Notify\nWebsite",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 61, 56, 56),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessStoriesScreen(),
                            ),
                          );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15.0),
                          elevation: 8.0,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'img/successStory.svg',
                                color: Colors.yellow.shade700,
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Success\nStories",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 61, 56, 56),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          color: Colors.white,
          activeColor: const Color.fromARGB(255, 45, 130, 48),
          tabBackgroundColor: const Color.fromARGB(33, 76, 175, 79),
          padding: const EdgeInsets.all(16),
          gap: 8,
          tabs: [
            const GButton(
              icon: Icons.home,
              iconColor: Color.fromARGB(255, 45, 130, 48),
              text: "Home",
              iconSize: 32,
            ),
            GButton(
              icon: Icons.person_2_sharp,
              iconColor: const Color.fromARGB(255, 45, 130, 48),
              text: "Profile",
              iconSize: 32,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfile(), // profile
                  ),
                );
              },
            ),
            GButton(
              icon: Icons.contact_support_rounded,
              iconColor: const Color.fromARGB(255, 45, 130, 48),
              text: "Support",
              iconSize: 32,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactUsWidget(),
                  ),
                );
              },
            ),
            GButton(
              icon: Icons.logout_rounded,
              iconColor: const Color.fromARGB(255, 45, 130, 48),
              text: "Logout",
              iconSize: 32,
              onPressed: () {
                _auth.signOut().then(
                  (value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: myitems.length,
        effect: SlideEffect(
          activeDotColor: Colors.green,
          dotColor: Colors.grey.shade400,
          dotHeight: 12,
          dotWidth: 12,
        ),
      );
}
