import 'package:e_commerce_app/views/widget/list_item.dart';
import 'package:e_commerce_app/views/widget/section_title.dart';
import 'package:flutter/material.dart';

class SaleSection extends StatelessWidget {
  const SaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Sale",
          onPressed: () {},
          action: "View all",
          subtitle: "Super super sale",
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const ListItem(),
              itemCount: 10),
        ),
      ],
    );
  }
}
