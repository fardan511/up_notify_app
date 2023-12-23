import 'package:flutter/material.dart';
import 'package:project/firebase_services/splash_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
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
                  image: AssetImage('img/logoLine.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              child: Text(
                "In this title, the UP relates to the biggest freelance marketplace Upwork and Notify relates to Notification.",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(221, 11, 42, 19),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'img/tick.svg',
                  width: 70,
                  height: 70,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
