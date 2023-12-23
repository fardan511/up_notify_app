import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/widgets/global_var.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

_buildUserImage() {
  return Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(adUserImageUrl),
        fit: BoxFit.fill,
      ),
    ),
  );
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 77, 156, 81),
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.green.shade50,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                child: _buildUserImage(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Text(
              ' $adUserName',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 45, 130, 48),
              ),
            ),
          ),
          Text(
            ' $userEmail',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 45, 130, 48),
            ),
          ),
        ],
      ),
    );
  }
}
