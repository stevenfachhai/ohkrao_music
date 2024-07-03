import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ohkrao_music/screen/video/video_player_screen.dart';
// Adjust import path as needed

class VideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Videos',
          style: GoogleFonts.yesevaOne(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the number of videos you have
        itemBuilder: (context, index) {
          return _buildVideoItem(context, index);
        },
      ),
    );
  }

  Widget _buildVideoItem(BuildContext context, int index) {
    String videoTitle = 'Video Title $index';
    String thumbnailUrl =
        'assets/for.jpg'; // Replace with your thumbnail image path
    String videoUrl = 'assets/sample_video.mp4'; // Replace with your video URL
    int views = 1000; // Replace with actual views count or duration

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              videoUrl: videoUrl,
              videoTitle: videoTitle,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                thumbnailUrl,
                width: 120,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoTitle,
                    style: GoogleFonts.libreBaskerville(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$views views',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
