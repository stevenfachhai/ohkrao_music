import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              const Text(
                'Your top genres',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  _buildExclusiveTile(context, 'Exclusive'),
                  _buildExclusiveTile(context, 'Genres'),
                  _buildExclusiveTile(context, 'Album'),
                  _buildExclusiveTile(context, 'Buy Tickets'),
                  _buildExclusiveTile(context, 'Merchandise'),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExclusiveTile(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective screen
      },
      child: Container(
        width: double.infinity, // Make the container full width
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                'assets/clarinet.png', // Replace with the path to your image file
                width: 50,
                height: 50,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20), // Add some space on the right side
          ],
        ),
      ),
    );
  }
}
