import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: 'EXPLORE'),
              Tab(text: 'TRENDING'),
              Tab(text: 'TOP CHART'),
              Tab(text: 'AUDIO LIBRARY'),
              Tab(text: 'NEWS'),
            ],
          ),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  buildContent(),
                  Center(
                      child: Text('Trending',
                          style: TextStyle(color: Colors.white))),
                  Center(
                      child: Text('Top Chart',
                          style: TextStyle(color: Colors.white))),
                  Center(
                      child: Text('Audio Library',
                          style: TextStyle(color: Colors.white))),
                  Center(
                      child:
                          Text('News', style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
            buildPlayerBar(),
          ],
        ),
      ),
    );
  }

  Widget buildContent() {
    return SingleChildScrollView(
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
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                _buildExclusiveTile('Exclusive'),
                _buildExclusiveTile('Genres'),
                _buildExclusiveTile('Album'),
                _buildExclusiveTile('Buy Tickets'),
                _buildExclusiveTile('Merchandise'),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildExclusiveTile(String title) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective screen
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/ohkrao.png', // Replace with the path to your image file
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlayerBar() {
    return Container(
      color: Colors.grey[900],
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Image.asset('assets/ohkrao.png',
              width: 50, height: 50), // Replace with the album art
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kyhpachána Vàdua', style: TextStyle(color: Colors.white)),
              Text('Mezzo Ford', style: TextStyle(color: Colors.white54)),
            ],
          ),
          Spacer(),
          Icon(Icons.pause, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.skip_next, color: Colors.white),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MusicScreen(),
  ));
}
