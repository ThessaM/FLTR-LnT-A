import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/CartPage.dart';
import 'package:main_fltr_lnt_a/LoginPage.dart';
import 'package:main_fltr_lnt_a/model/Product.dart';
import 'package:main_fltr_lnt_a/provider/CartProvider.dart';
import 'package:main_fltr_lnt_a/provider/UserProvider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Product> products = [
    Product("Apple", 2.5),
    Product("Banana", 1.2),
    Product("Orange", 3),
  ];

  // List<Product> cartProduct = [];

  // void addToCart(Product item){
  //   setState(() {
  //     cartProduct.add(item);
  //   });
  // }

  // void removeItem(int index) {
  //   setState(() {
  //     cartProduct.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //TODO: Get Cart Length
    // final cartCount = cartProduct.length;
    final cartCount = context.watch<Cartprovider>().cart.length;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text("Simple Shop"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          ElevatedButton(
            onPressed: () {
              context.read<Userprovider>().logout();
            },
            child: Icon(Icons.logout, color: Colors.white,),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        mainAxisAlignment: .center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Welcome, ${context.select<Userprovider, String>((value) =>  value.username,)}"),
          ),
          Expanded(
            child: ListView.builder(
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
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
            
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.teal[100],
                      child: Icon(Icons.shopping_bag, color: Colors.teal),
                    ),
            
                    title: Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        // addToCart(product);
                        context.read<Cartprovider>().addToCart(product);
                      },
                      child: Text("Add", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {
              if (context.read<Userprovider>().isLoggedIn()) {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (_) => CartPage(cart: cartProduct, removeItem: (index) {
                  //   removeItem(index);
                  // },)),
                  MaterialPageRoute(builder: (_) => CartPage()),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Loginpage()),
                );
              }
            },
            child: Icon(Icons.shopping_cart, color: Colors.white),
          ),

          if (cartCount > 0)
            Positioned(
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.redAccent,
                child: Text(
                  cartCount.toString(),
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
