import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/upwork_jobs/after_effects.dart';
import 'package:project/upwork_jobs/amazon/amazon_campaign.dart';
import 'package:project/upwork_jobs/amazon/amazon_dropshipping.dart';
import 'package:project/upwork_jobs/amazon/amazon_fba.dart';
import 'package:project/upwork_jobs/amazon/amazon_keyword.dart';
import 'package:project/upwork_jobs/amazon/amazon_listing.dart';
import 'package:project/upwork_jobs/amazon/amazon_seo.dart';
import 'package:project/upwork_jobs/amazon/amazon_ppc.dart';
import 'package:project/upwork_jobs/angular.dart';
import 'package:project/upwork_jobs/animate.dart';
import 'package:project/upwork_jobs/artificial_intelligence.dart';
import 'package:project/upwork_jobs/autocad.dart';
import 'package:project/upwork_jobs/blockchain.dart';
import 'package:project/upwork_jobs/bootstrap.dart';
import 'package:project/upwork_jobs/data_analysis.dart';
import 'package:project/upwork_jobs/data_mining.dart';
import 'package:project/upwork_jobs/desktop_application.dart';
import 'package:project/upwork_jobs/flask.dart';
import 'package:project/upwork_jobs/flutter_jobs.dart';
import 'package:project/upwork_jobs/game_development.dart';
import 'package:project/upwork_jobs/html_css.dart';
import 'package:project/upwork_jobs/illustrator.dart';
import 'package:project/upwork_jobs/javascript.dart';
import 'package:project/upwork_jobs/laravel.dart';
import 'package:project/upwork_jobs/light_room.dart';
import 'package:project/upwork_jobs/machine_learning.dart';
import 'package:project/upwork_jobs/next_js.dart';
import 'package:project/upwork_jobs/node_js.dart';
import 'package:project/upwork_jobs/photoshop.dart';
import 'package:project/upwork_jobs/premiere_pro.dart';
import 'package:project/upwork_jobs/python.dart';
import 'package:project/upwork_jobs/react_native.dart';
import 'package:project/upwork_jobs/react_native_app.dart';
import 'package:project/upwork_jobs/unity_app.dart';
import 'package:project/upwork_jobs/vue_js.dart';
import 'package:project/upwork_jobs/xamarin.dart';

class UpworkJobs extends StatelessWidget {
  const UpworkJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 77, 156, 81),
        title: Text(
          'Upwork Jobs',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.green.shade50,
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              height: h * 0.05,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 12, 0, 0),
                child: Text(
                  'Software Development',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/game.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              title: Text(
                'Game Development',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GameDevelopmentJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/bitcoin.svg',
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
              title: Text(
                'Blockchain, NFT and Cryptocurrency',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle the first button action
                          // You can add your logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.green, // Set the background color
                          foregroundColor: Colors.white, // Set the text color
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BlockChainJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.green, // Set the background color
                          foregroundColor: Colors.white, // Set the text color
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/desktop.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              title: Text(
                'Desktop application development',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DesktopApplicationJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              width: w,
              height: h * 0.05,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 12, 0, 0),
                child: Text(
                  'Mobile Development',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/unity.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              title: Text(
                'Unity 3D',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UnityAppJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/flutter.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              title: Text(
                'Flutter',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FlutterJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/xamarin.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              title: Text(
                'Xamarin',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const XamarinJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/reactApp.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'React JS ',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReactNativeAppJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              width: w,
              height: h * 0.05,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 12, 0, 0),
                child: Text(
                  'Website Development',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/html.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'HTML CSS ',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HTMLCSSJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: Image.asset(
                    'img/javascript.png',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Java Script',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const JavaScriptJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: Image.asset(
                    'img/bootstrap.png',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Bootstrap',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BootstrapJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/python.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Python',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PythonDjangoJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/laravel.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'laravel',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LaravelJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/reactApp.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'React Native ',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReactNativeWebJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/node.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Node JS ',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NodeJSJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/next.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Next JS ',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NextJSJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/vue.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Vue.JS ',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VueJSJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/angular.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Angular',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AngularJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/flask.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Python Flask',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FlaskJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              width: w,
              height: h * 0.05,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 12, 0, 0),
                child: Text(
                  'AI and Machine Learning',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/mining.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Data Mining',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DataMiningJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/analysis.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Data Analysis',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DataAnalysisJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/ml.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Machine Learning',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MachineLearningJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/ai.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Artificial Intelligence',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ArtificialIntelligenceJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              width: w,
              height: h * 0.05,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 12, 0, 0),
                child: Text(
                  'Adobe',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/photoshop.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Adobe Photoshop',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhotoshopJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/premiere.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Adobe Premiere Pro',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PremiereJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/illustrator.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Adobe Illustrator',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IllustratorJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/afterEffect.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Adobe After Effect',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AfterEffectsJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/lightroom.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Adobe Lightroom',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LightRoomJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/animate.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Adobe Animate',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AnimateJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              width: w,
              height: h * 0.05,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 12, 0, 0),
                child: Text(
                  '3D Modeling',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: Image.asset(
                    'img/autocad.png',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'AUTOCAD',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AutocadJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(1, 1),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ],
              ),
              width: w,
              height: h * 0.05,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 12, 0, 0),
                child: Text(
                  'Amazon',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/amazon.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Amazon PPC',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AmazonPPCJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/amazon.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Amazon Keyword Research',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AmazonKeywordResearchJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/amazon.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Amazon Search Engine Optimization',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AmazonSEOJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/amazon.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Listing Optimization',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AmazonListingJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/amazon.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Amazon FBA',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AmzaonFBAJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/amazon.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Amazon PPC Campaign Setup & Management',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AmazonCampaignJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'img/amazon.svg',
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              title: Text(
                'Amazon Drop shipping',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 0, 20, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Notification'),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AmazonDropshippingJobs(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Jobs'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
