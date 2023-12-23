// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({super.key});

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'upnotify511@gmail.com',
      // queryParameters: {'subject': 'Write Your Subject'},
    );

    try {
      await launch(emailLaunchUri.toString());
    } catch (e) {
      // ignore: avoid_print
      print('Error launching email client: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 77, 156, 81),
        title: Text(
          'Contact Us',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.green.shade50,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Text(
                  'If you have any questions or feedback, \nplease feel free to contact us via email.',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 140,
                  height: 40,
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
                    onPressed: _sendEmail,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Text(
                      'Send Email',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 30),
                // Text(
                //   'Click here to Join our WhatsApp community to stay updated with the latestfeatures.',
                //   style: GoogleFonts.poppins(
                //       fontSize: 18, fontWeight: FontWeight.w600),
                // ),
                // const SizedBox(height: 30),
                // Container(
                //   width: 140,
                //   height: 40,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30),
                //     gradient: const LinearGradient(
                //       colors: [
                //         Color.fromARGB(161, 24, 146, 54),
                //         Color.fromARGB(217, 34, 163, 57),
                //       ],
                //       begin: Alignment.centerLeft,
                //       end: Alignment.centerRight,
                //     ),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.5),
                //         blurRadius: 5,
                //         spreadRadius: 2,
                //         offset: const Offset(0, 3),
                //       ),
                //     ],
                //   ),
                //   child: ElevatedButton(
                //     onPressed: _sendEmail,
                //     style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //       backgroundColor: Colors.transparent,
                //       elevation: 0,
                //     ),
                //     child: Text(
                //       'Send Email',
                //       style: GoogleFonts.poppins(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
