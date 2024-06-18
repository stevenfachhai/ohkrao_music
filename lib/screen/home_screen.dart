import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siaramo_music/screen/library_screen.dart';
import 'package:siaramo_music/screen/music_screen.dart';
import 'package:siaramo_music/screen/store/store_screen.dart';
import 'package:siaramo_music/screen/video/video_list_screen.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCombinedSection(
                context, 'Song of the Month', 'Video of the Month'),
            SizedBox(height: 20),
            _buildSection(context, 'New Release'),
            SizedBox(height: 20),
            _buildSection(context, 'Siâramo Music For You'),
            SizedBox(height: 20),
            _buildSection(context, 'Siâramo Video For You'),
            SizedBox(height: 20),
            _buildSection(context, 'Top Charts'),
            SizedBox(height: 20),
            _buildSection(context, 'Playlist'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCombinedSection(
      BuildContext context, String songTitle, String videoTitle) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songTitle,
                  style: GoogleFonts.yesevaOne(
                    fontSize: 24,
                    color: const Color.fromARGB(255, 7, 7, 7),
                  ),
                ),
                SizedBox(height: 10),
                _buildSingleItem(
                    context, 'assets/song_placeholder.png', songTitle),
              ],
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoTitle,
                  style: GoogleFonts.yesevaOne(
                    fontSize: 24,
                    color: const Color.fromARGB(255, 3, 3, 3),
                  ),
                ),
                SizedBox(height: 10),
                _buildSingleItem(
                    context, 'assets/video_placeholder.png', videoTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.yesevaOne(
            fontSize: 24,
            color: const Color.fromARGB(255, 7, 7, 7),
          ),
        ),
        SizedBox(height: 10),
        _buildHorizontalList(context, title),
      ],
    );
  }

  Widget _buildHorizontalList(BuildContext context, String type) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/placeholder.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '$type ${index + 1}',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 12, 12, 12),
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSingleItem(
      BuildContext context, String imagePath, String title) {
    return Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: const Color.fromARGB(255, 12, 12, 12),
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    MusicScreen(),
    LibraryScreen(),
    VideoListScreen(),
    StoreScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Handle notification icon press
          },
        ),
        title: Center(
          child: Text(
            'SIÂRAMO MUSIC & VIDEO',
            style:
                GoogleFonts.yesevaOne(color: Color.fromARGB(255, 10, 10, 10)),
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'MUSIC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'UPLOAD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'VIDEOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'STORE',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Color.fromARGB(255, 11, 11, 11),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
