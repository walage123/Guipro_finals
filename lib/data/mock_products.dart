final List<Products> mockProducts = [
  product(
    id: '1',
    name: 'Eco Bamboo Toothbrush',
    description: 'Eco-friendly bamboo toothbrush with soft bristles.',
    price: 3.99,
    imageUrl: 'https://via.placeholder.com/150',
  ),
  product(
    id: '2',
    name: 'Reusable Shopping Bag',
    description: 'Durable and reusable bag made from recycled materials.',
    price: 5.49,
    imageUrl: 'https://via.placeholder.com/150',
  ),
];

mixin Products {
}

product({required String id, required String name, required String description, required double price, required String imageUrl}) {
}