import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ohkrao_music/screen/library_screen.dart';
import 'package:ohkrao_music/screen/music_screen.dart';
import 'package:ohkrao_music/screen/store/store_screen.dart';
import 'package:ohkrao_music/screen/video/video_list_screen.dart';

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
            _buildSection(context, 'Ôhkrao Music For You'),
            SizedBox(height: 20),
            _buildSection(context, 'Ôhkrao Video For You'),
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
                    color: Color.fromARGB(255, 8, 8, 8),
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
                    color: Color.fromARGB(255, 17, 17, 17),
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
    if (title == 'New Release') {
      return _buildNewReleaseBanner(context);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.yesevaOne(
              fontSize: 24,
              color: Color.fromARGB(255, 245, 242, 242),
            ),
          ),
          SizedBox(height: 10),
          _buildHorizontalList(context, title),
        ],
      );
    }
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
                    color: Color.fromARGB(255, 248, 243, 243),
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
              color: Color.fromARGB(255, 249, 247, 247),
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildNewReleaseBanner(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey,
            image: DecorationImage(
              image: AssetImage('assets/for.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 16,
          child: Container(
            width: 120,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/for.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 150,
          top: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MEZZO FORD',
                style: GoogleFonts.yesevaOne(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                'KYMPACHANA VADA',
                style: GoogleFonts.yesevaOne(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'AUDIO',
                style: GoogleFonts.yesevaOne(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.shopping_cart, color: Colors.white),
              Text(
                'BUY NOW',
                style: GoogleFonts.yesevaOne(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                '\$20',
                style: GoogleFonts.yesevaOne(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
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
    StoreScreen(),
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
            'ÔHKRAO MUSIC & VIDEO',
            style: GoogleFonts.yesevaOne(
                color: Color.fromARGB(255, 254, 253, 253)),
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
            icon: ImageIcon(AssetImage('assets/Home.PNG')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/music.PNG')),
            label: 'MUSIC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'UPLOAD',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/videos.PNG')),
            label: 'VIDEOS',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Store.PNG')),
            label: 'STORE',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Color.fromARGB(255, 251, 248, 248),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        onTap: _onItemTapped,
      ),
    );
  }
}
