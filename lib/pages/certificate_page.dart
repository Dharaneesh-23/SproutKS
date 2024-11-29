import 'dart:io';

import 'package:flutter/material.dart';


class CertificatePage extends StatelessWidget {
  final String userName;
  final String courseName;

  CertificatePage({required this.userName, required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Certificate")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CONGRATULATIONS!!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("We Appreciate Your Efforts", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            // Certificate Image
            Stack(
              alignment: Alignment.center,
              children: [
                // Certificate Template Image
                Image.asset(
                  'assets/images/certificate_template.png', // Path to your certificate template
                  width: 350,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                // Text Overlay
                Positioned(
                  top: 150, // Adjust the position as needed
                  child: Text(
                    userName+ ' in '+courseName,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Adjust text color to match the template
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Learning that's Futuristic\nLearning that's Fun",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            SizedBox(height: 20),
            // Buttons for Share and Download
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //vuyb
                  },
                  child: Text("SHARE"),
                  style: ElevatedButton.styleFrom(backgroundColor:  Colors.orange),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Download functionality
                  },
                  child: Text("DOWNLOAD"),
                  style: ElevatedButton.styleFrom(backgroundColor:  Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




