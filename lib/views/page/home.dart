import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/views/widget/header_of_home_page.dart';
import 'package:e_commerce_app/views/widget/new_section.dart';
import 'package:e_commerce_app/views/widget/sale_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final List<Product> products = dummyProducts;
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderOfHomePage(),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SaleSection(
                  products: products,
                ),
                NewSection(
                  products: products,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
