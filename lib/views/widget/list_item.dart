import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    AppAssets.headerImageOfHome,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 200,
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "-${product.discountValue}%",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: -12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.favorite_outlined,
                        color: Colors.red, size: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ...List.generate(
                    product.rate?.toInt() ?? 1,
                    (index) =>
                        const Icon(Icons.star, color: Colors.amber, size: 14)),
                // Icon(Icons.star, color: Colors.amber, size: 14),
                // Icon(Icons.star, color: Colors.amber, size: 14),
                // Icon(Icons.star, color: Colors.amber, size: 14),
                // Icon(Icons.star, color: Colors.amber, size: 14),
                // Icon(Icons.star, color: Colors.amber, size: 14),
                const SizedBox(width: 4),
                const Text(
                  "(10)",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(width: 4),
              ],
            ),
            Text(
              product.title,
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              product.category,
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Text(
                  "\$${product.price}",
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "\$${product.price - (product.price * (product.discountValue?.toInt() ?? 0) / 100)}",
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
