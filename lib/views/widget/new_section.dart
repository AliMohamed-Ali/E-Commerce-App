import 'package:e_commerce_app/views/widget/list_item.dart';
import 'package:e_commerce_app/views/widget/section_title.dart';
import 'package:flutter/material.dart';

class NewSection extends StatelessWidget {
  const NewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "New",
          onPressed: () {},
          action: "View all",
          subtitle: "You’ve never seen it before!",
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const ListItem(),
              itemCount: 30),
        ),
      ],
    );
  }
}
