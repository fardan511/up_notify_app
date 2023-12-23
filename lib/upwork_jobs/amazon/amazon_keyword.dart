// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors,, avoid_print, unused_local_variable, unused_import, use_build_context_synchronously, unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart' as xml;
import 'package:selectable/selectable.dart';
import 'dart:async';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class AmazonKeywordResearchJobs extends StatefulWidget {
  const AmazonKeywordResearchJobs({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _AmazonKeywordResearchJobsState createState() =>
      _AmazonKeywordResearchJobsState();
}

class _AmazonKeywordResearchJobsState extends State<AmazonKeywordResearchJobs> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Use Uri.parse to create the Uri
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not Launch URL";
    }
  }

// notification
//   NotificationServices notificationServices = NotificationServices();

  final String rssFeedUrl =
      'https://www.upwork.com/ab/feed/jobs/rss?q=Amazon+Keyword+Research&sort=recency&paging=0%3B50&api_params=1&securityToken=16ee94fbc170be3746e4c2f537fe0dd26609cd1375b38ed654f7abbc3bdd037b3d2e8dcc7d24c01bcc95628fea6c237a9b6c8d356e4c0ac652892b5037279bcd&userUid=1556630119112642560&orgUid=1556630119112642561';

  String formatDescription(String description) {
    description = description.replaceAll(RegExp(r'<a [^>]*>[^<]*</a>'), '');

    bool skillsShown = false;
    List<String> skills = [];

    List<String> lines = description.split(RegExp(r'\n'));

    for (var line in lines) {
      if (line.contains("Skills:")) {
        skillsShown = true;
        continue;
      }
      if (skillsShown) {
        skills.add(line.trim());
      }
    }

    description = description.replaceAll(RegExp(r'<br */?>'), '\n');

    description = description.replaceAllMapped(
      RegExp(r'<b>(.*?)</b>'),
      (match) {
        return '\n${match.group(1)}';
      },
    );

    return description;
  }

  Future<List<Map<String, String>>?> fetchRssFeed() async {
    final response = await http.get(Uri.parse(rssFeedUrl));

    if (response.statusCode == 200) {
      final body = response.body;

      final document =
          xml.XmlDocument.parse(body); // Use parse from XmlDocument
      List<Map<String, String>> jobDetailsList = [];

      for (var item in document.findAllElements('item')) {
        var title = item.findElements('title').single.text;
        var link = item.findElements('link').single.text;
        var descriptionElement = item.findElements('description').single;
        var description = descriptionElement.text;
        var pubDate = item.findElements('pubDate').single.text;
        description = formatDescription(description);

        Map<String, String> jobDetails = {
          'Title': title,
          'Link': link,
          'Description': description,
          'Date': pubDate,
        };

        jobDetailsList.add(jobDetails);
      }

      return jobDetailsList;
    } else {
      throw Exception('Failed to load RSS feed');
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   notificationServices.requestNotificationPermission();
  //   notificationServices.firebaseInit();
  //   // notificationServices.isTokenRefresh();
  //   notificationServices.getDeviceToken().then((value) {
  //     ('device Token');
  //     print(value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Amazon Keyword Research Jobs',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.green.shade500,
        ),
        body: FutureBuilder<List<Map<String, String>>?>(
          future: fetchRssFeed(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final jobDetailsList = snapshot.data;
              return Container(
                color: const Color.fromARGB(158, 200, 230, 201),
                child: ListView.builder(
                  itemCount: jobDetailsList?.length,
                  itemBuilder: (context, index) {
                    var jobDetails = jobDetailsList?[index];
                    DateTime utcTime = DateFormat('E, dd MMM yyyy HH:mm:ss Z')
                        .parse(jobDetails?['Date'] ?? '');
                    DateTime istTime = utcTime.toLocal().add(
                          const Duration(hours: 5, minutes: 00),
                        );
                    return Selectable(
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        child: ExpansionTile(
                          backgroundColor:
                              const Color.fromARGB(12, 76, 175, 79),
                          title: Text(
                            jobDetails?['Title'] ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          children: [
                            ListTile(
                              leading: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                'Added on',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Text(
                                  DateFormat.yMMMMd().add_jm().format(istTime),
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.description_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                'Description',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(
                                  top: 12,
                                ),
                                child: Text(
                                  jobDetails?['Description'] ?? '',
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    color: Colors.black87,
                                    wordSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.link_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                'Link',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 7, 0, 9),
                                child: GestureDetector(
                                  onTap: () {
                                    _launchURL(jobDetails?['Link'] ?? '');
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 8, 2),
                                    child: Text(
                                      'Click here to apply',
                                      style: GoogleFonts.poppins(
                                        decoration: TextDecoration.underline,
                                        fontSize: 17,
                                        color: Colors.green.shade800,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
