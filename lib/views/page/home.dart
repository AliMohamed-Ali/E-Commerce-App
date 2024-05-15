import 'package:e_commerce_app/utils/app_assets.dart';
import 'package:e_commerce_app/views/widget/header_of_home_page.dart';
import 'package:e_commerce_app/views/widget/list_item.dart';
import 'package:e_commerce_app/views/widget/new_section.dart';
import 'package:e_commerce_app/views/widget/sale_section.dart';
import 'package:e_commerce_app/views/widget/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderOfHomePage(),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SaleSection(),
                NewSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
