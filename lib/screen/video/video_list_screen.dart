import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siaramo_music/screen/video/video_player_screen.dart';

class VideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Videos',
            style: GoogleFonts.yesevaOne(
              color: Color.fromARGB(255, 10, 10, 10),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle profile icon press
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
        'assets/thumbnail_placeholder.png'; // Replace with your thumbnail image path
    String videoUrl = 'assets/sample_video.mp4'; // Replace with your video URL

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              videoUrl: videoUrl,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Row(
          children: [
            Image.asset(
              thumbnailUrl,
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                videoTitle,
                style: GoogleFonts.libreBaskerville(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
