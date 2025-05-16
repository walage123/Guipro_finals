import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: cartProvider.items.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final productId = cartProvider.items.keys.elementAt(index);
                      final quantity = cartProvider.items[productId]!;
                      final product = cartProvider.cartProducts.firstWhere(
                        (p) => p.id == productId,
                        orElse: () =>
                            throw StateError('Product not found in cartProducts'),
                      );
                      return CartItemTile(
                        product: product,
                        quantity: quantity,
                        onRemove: () => cartProvider.removeFromCart(productId),
                        onQuantityChanged: (newQuantity) =>
                            cartProvider.updateQuantity(productId, newQuantity),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Subtotal: \$${cartProvider.total.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/checkout'),
                        style:
                            ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: const Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}