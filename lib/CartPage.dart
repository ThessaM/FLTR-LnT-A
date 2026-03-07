import 'package:flutter/material.dart';


class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Get item from list
    final cart = [];

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),

      body: cart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Your cart is empty",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

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
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    subtitle: Text(
                      "\$${item.price}",
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        //TODO: Remove item from list
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}