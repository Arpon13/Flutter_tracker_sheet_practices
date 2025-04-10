import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedGridCardList(),
  ));
}

class AnimatedGridCardList extends StatelessWidget {
  const AnimatedGridCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ProductData(
        "Headphones",
        "Wireless over-ear headphones",
        "Rp. 1.500.000",
        4.6,
        86,
        "https://www.energysistem.com/cdnassets/products/45305/principal_2000.jpg",
      ),
      ProductData(
        "Audio Cable",
        "High-quality coiled audio cable",
        "Rp. 350.000",
        4.6,
        86,
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MC9C4?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1728939676342",
      ),
      ProductData(
        "Drill Machine",
        "Cordless heavy-duty drill",
        "Rp. 2.000.000",
        4.6,
        86,
        "https://media.istockphoto.com/id/184639599/photo/power-drill-with-large-bit.jpg?s=612x612&w=0&k=20&c=TJczKvZqLmWc5c5O6r86jelaUbYFLCZnwA_uWlhHOG0=",
      ),
      ProductData(
        "Headphones (Black)",
        "Comfortable sound experience",
        "Rp. 1.500.000",
        4.6,
        86,
        "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MQTQ3?wid=1377&hei=2057&fmt=jpeg&qlt=95&.v=1741643688229",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Grid"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(product: items[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductData {
  final String title;
  final String subtitle;
  final String price;
  final double rating;
  final int reviewCount;
  final String imageUrl;

  ProductData(this.title, this.subtitle, this.price, this.rating, this.reviewCount, this.imageUrl);
}

class ProductCard extends StatefulWidget {
  final ProductData product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on ${widget.product.title}')),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: _isHovered ? Colors.lightBlue.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? Colors.lightBlue.shade200 : Colors.grey.withOpacity(0.3),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  widget.product.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.product.subtitle,
                      style: const TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.product.price,
                      style: const TextStyle(fontSize: 14, color: Colors.red),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          "${widget.product.rating}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "(${widget.product.reviewCount} Reviews)",
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
