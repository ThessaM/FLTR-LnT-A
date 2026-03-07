import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/CartPage.dart';
import 'package:main_fltr_lnt_a/model/Product.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final cartCount = 0;

  final List<Product> products = [
    Product("Apple", 2.5),
    Product("Banana", 1.2),
    Product("Orange", 3),
  ];

  @override
  Widget build(BuildContext context) {

    //TODO: Get Cart Length

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text("Simple Shop"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {

          final product = products[index];

          return Card(
            elevation: 3,
            margin: EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 10),

              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.teal[100],
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.teal,
                ),
              ),

              title: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              subtitle: Text(
                "\$${product.price}",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w500,
                ),
              ),

              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  //TODO: Add Item to Cart
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: Stack(
        children: [

          FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartPage()),
              );
            },
            child: Icon(Icons.shopping_cart, color: Colors.white,),
          ),

          if (cartCount > 0)
            Positioned(
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.redAccent,
                child: Text(
                  cartCount.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}