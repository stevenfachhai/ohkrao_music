import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String productImage;

  const ProductDetailsScreen({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(productImage),
            SizedBox(height: 20),
            Text(
              productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\$$productPrice',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 20),
            Text(
              'Product description goes here...',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle add to cart
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
