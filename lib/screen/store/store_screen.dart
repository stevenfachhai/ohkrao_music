import 'package:flutter/material.dart';
import 'product_upload_screen.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('List of Products'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductUploadScreen(),
                  ),
                );
              },
              child: Text('Upload Product'),
            ),
          ],
        ),
      ),
    );
  }
}
