import 'package:e_commerce_app/utils/app_assets.dart';
import 'package:flutter/material.dart';

class HeaderOfHomePage extends StatelessWidget {
  const HeaderOfHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    
    return Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              AppAssets.headerImageOfHome,
              width: double.infinity,
              height: size.height * 0.3,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.3,
              color: Colors.black.withOpacity(0.2),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Street clothes",
                style: textTheme.headlineLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
  }
}