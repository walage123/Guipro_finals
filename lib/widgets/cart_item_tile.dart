import 'package:flutter/material.dart'; 
import '../models/product.dart';

class CartItemTile extends StatelessWidget {
  final Product product; 
  final int quantity; 
  final VoidCallback onRemove; 
  final ValueChanged<int> onQuantityChanged;

  const CartItemTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.image_not_supported_outlined); 
        },
      ),
      title: Text(product.name), 
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'), 
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (quantity > 1) {
                onQuantityChanged(quantity - 1); 
              } else {
                onRemove(); 
              }
            },
          ),
          Text('$quantity'), 
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => onQuantityChanged(quantity + 1),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: onRemove, 
          ),
        ],
      ),
    );
  }
}