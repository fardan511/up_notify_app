import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/job_screen/job_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageSliderScreen extends StatefulWidget {
  final String title, urlImage1, urlImage2, urlImage3, urlImage4, urlImage5;
  final String jobEligible, userNumber, jobDescription, address, jobPrice;
  final double lat, lng;

  // ignore: use_key_in_widget_constructors
  const ImageSliderScreen({
    required this.title,
    required this.urlImage1,
    required this.urlImage2,
    required this.urlImage3,
    required this.urlImage4,
    required this.urlImage5,
    required this.jobEligible,
    required this.userNumber,
    required this.jobDescription,
    required this.address,
    required this.jobPrice,
    required this.lat,
    required this.lng,
  });

  @override
  State<ImageSliderScreen> createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen>
    with SingleTickerProviderStateMixin {
  static List<String> links = [];
  TabController? tabController;

  getLinks() {
    links.add(widget.urlImage1);
    links.add(widget.urlImage2);
    links.add(widget.urlImage3);
    links.add(widget.urlImage4);
    links.add(widget.urlImage5);
  }

  @override
  void initState() {
    super.initState();
    getLinks();
    tabController = TabController(length: 5, vsync: this);
  }

  String? url;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(color: Colors.green.shade50),
      child: Scaffold(
        backgroundColor: Colors.green.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.green,
          title: Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 6.0, right: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Expanded(
                      child: Text(
                        widget.address,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(letterSpacing: 2.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: h * 0.5,
                width: w,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Carousel(
                    indicatorBarColor: Colors.transparent,
                    autoScrollDuration: const Duration(seconds: 2),
                    animationPageDuration: const Duration(milliseconds: 500),
                    activateIndicatorColor: Colors.green,
                    animationPageCurve: Curves.easeIn,
                    indicatorBarHeight: 30,
                    indicatorHeight: 10,
                    indicatorWidth: 10,
                    unActivatedIndicatorColor: Colors.green.shade100,
                    stopAtEnd: false,
                    autoScroll: true,
                    items: [
                      Image.network(
                        widget.urlImage1,
                      ),
                      Image.network(
                        widget.urlImage2,
                      ),
                      Image.network(
                        widget.urlImage3,
                      ),
                      Image.network(
                        widget.urlImage4,
                      ),
                      Image.network(
                        widget.urlImage5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Center(
                  child: Text(
                    'Pkr ${widget.jobPrice}',
                    style: const TextStyle(
                      fontSize: 24,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: Colors.green,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(widget.jobEligible),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_android,
                          color: Colors.green,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(widget.userNumber),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  widget.jobDescription,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(
                    width: 368,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      double latitude = widget.lat;
                      double longitude = widget.lng;
                      url =
                          'https://www.google.com/maps/search/?api=1&query=$latitude , $longitude';
                      if (await canLaunchUrl(
                        Uri.parse(url!),
                      )) {
                        await launchUrl(
                          Uri.parse(url!),
                        );
                      } else {
                        throw 'Could not open the Map';
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text(
                      'Check Their Location',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
