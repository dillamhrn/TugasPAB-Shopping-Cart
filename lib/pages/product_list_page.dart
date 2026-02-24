import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String query = '';
  String selectedCategory = 'All';

  final categories = const ['All', 'Make Up', 'Skincare'];

  @override
  Widget build(BuildContext context) {
    final products = <Product>[
      Product(
        id: '1',
        name: 'Lip Stick',
        price: 150000,
        emoji: '💄',
        description: 'Tint ringan, awet',
        category: 'Make Up',
      ),
      Product(
        id: '2',
        name: 'Face Wash',
        price: 99000,
        emoji: '🧼',
        description: 'Tint ringan, awet',
        category: 'Skincare',
      ),
      Product(
        id: '3',
        name: 'Moisturizer Glow',
        price: 120000,
        emoji: '🧴',
        description: 'Lembap & glowing',
        category: 'Skincare',
      ),
      Product(
        id: '4',
        name: 'Sunscreen SPF 50',
        price: 85000,
        emoji: '🌤️',
        description: 'Anti UV nyaman',
        category: 'Skincare',
      ),
      Product(
      id: '5',
      name: 'Blush On Natural',
      price: 110000,
      emoji: '🌸',
      description: 'Warna natural tahan lama',
      category: 'Make Up',
    ),
    Product(
      id: '6',
      name: 'Serum Brightening',
      price: 175000,
      emoji: '✨',
      description: 'Mencerahkan & meratakan warna kulit',
      category: 'Skincare',
    ),
    ];

    final q = query.trim().toLowerCase();
    final filtered = products.where((p) {
      final matchName = q.isEmpty || p.name.toLowerCase().contains(q);
      final matchCat = selectedCategory == 'All' || p.category == selectedCategory;
      return matchName && matchCat;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('── ⋆˚۶ৎ ｡ּ BeautyStore 🛍'), backgroundColor: const Color(0xFFF1C9D8),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color:Color(0xFF5A4A4D)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: Color(0xFFD64F91),
                        child: Text(
                          '${cart.itemCount}',
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search product...',
                      prefixIcon: Icon(Icons.search, color: Color(0xFF5A4A4D),),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) => setState(() => query = v),
                  ),
                ),
                const SizedBox(width: 20),
                DropdownButton<String>(
                  value: selectedCategory,
                  items: categories
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setState(() => selectedCategory = v ?? 'All'),
                ),
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final product = filtered[index];
                return Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: const Color(0xFFF1C9D8),
                          child: Center(
                            child: Text(
                              product.emoji,
                              style: const TextStyle(fontSize: 60),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(product.name, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5A4A4D))),
                            const SizedBox(height: 0),
                            Text('Rp${product.price.toStringAsFixed(0)}', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 75, 105, 41)),),
                            const SizedBox(height: 0),
                            Text(product.category, style: TextStyle(fontSize: 10, color: Colors.grey[700])),
                            const SizedBox(height: 2),
                            ElevatedButton.icon(
                              onPressed: () {
                                context.read<CartModel>().addItem(product);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0)
                              ),
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                size: 13,
                                color: Color(0xFF5A4A4D),
                              ),
                              label: const Text(
                                'Add',
                                style: TextStyle(
                                  color: Color(0xFF5A4A4D),
                                  fontSize: 12
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}