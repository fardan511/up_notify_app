import 'package:flutter/material.dart';

import 'package:project/splash_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // ignore: non_constant_identifier_names
  final PageController _controller = PageController();

//  keep track of if we are on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(
                () {
                  onLastPage = (index == 3);
                },
              );
            },
            children: [
              Container(
                color: Colors.green.shade50,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Image(
                          image: AssetImage(
                            'img/logoMain.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                    const Image(image: AssetImage('img/logoLine.png')),
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      width: 300,
                      child: Image(
                        image: AssetImage(
                          'img/aauth.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        Text(
                          'Secure user verification methods',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '"Implementing secure user verification \nmethods enhances mobile app \nlogin security."',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                // ignore: prefer_const_constructors
                color: Colors.green.shade50,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Image(
                          image: AssetImage(
                            'img/logoMain.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                    const Image(image: AssetImage('img/logoLine.png')),
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      width: 230,
                      child: Image(
                        image: AssetImage(
                          'img/chat_gpt.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        Text(
                          'Customized Letter Generation',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          // ignore: unnecessary_const
                          child: Text(
                            '"Experience the future of job application \nwith our AI personalized cover\nletter generator"',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    // height: 60,
                    // width: 60,
                    // child: ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //       shape: const CircleBorder(),
                    //       backgroundColor: Colors.green),
                    //   child: const Icon(
                    //     Icons.arrow_forward,
                    //     color: Colors.white,
                    //   ),
                    // ),

                    // ),
                  ],
                ),
              ),
              Container(
                color: Colors.green.shade50,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Image(
                          image: AssetImage(
                            'img/logoMain.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                    const Image(
                      image: AssetImage('img/logoLine.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: 300,
                      child: Image(
                        image: AssetImage(
                          'img/cover_letter.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        Text(
                          'Never missed any Opportunities',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '"Maximize your career potential \nCatch every new job \nopportunity."',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    // height: 60,
                    // width: 60,
                    // child: ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //       shape: const CircleBorder(),
                    //       backgroundColor: Colors.green),
                    //   child: const Icon(
                    //     Icons.arrow_forward,
                    //     color: Colors.white,
                    //   ),
                    // ),

                    // ),
                  ],
                ),
              ),
              Container(
                color: Colors.green.shade50,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Image(
                          image: AssetImage(
                            'img/logoMain.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                    const Image(image: AssetImage('img/logoLine.png')),
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      width: 220,
                      child: Image(
                        image: AssetImage(
                          'img/success.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        Text(
                          'Real-life success Examples.',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '"Struggles, victories, and determination \nthese success stories \nempower us all."',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    // height: 60,
                    // width: 60,
                    // child: ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //       shape: const CircleBorder(),
                    //       backgroundColor: Colors.green),
                    //   child: const Icon(
                    //     Icons.arrow_forward,
                    //     color: Colors.white,
                    //   ),
                    // ),

                    // ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350.0),
            child: Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(3);
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),

                  //dot indicator
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: WormEffect(
                          activeDotColor: Colors.green,
                          dotColor: Colors.grey.shade400)),

                  //next or done
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SplashScreen();
                            }));
                          },
                          child: Text(
                            'Done',
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            'Next',
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
