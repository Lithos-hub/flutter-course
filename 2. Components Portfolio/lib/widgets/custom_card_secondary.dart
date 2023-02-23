import 'package:components_portfolio/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardSecondary extends StatelessWidget {
  const CustomCardSecondary(
      {super.key, required this.imageUrl, this.imageDesc});

  final String imageUrl;
  final String? imageDesc;

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        shadowColor: AppTheme.secondary.withOpacity(0.5),
        child: Column(
          children: [
            FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/loading.gif'),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
            ),
            if (imageDesc != null)
              Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.all(20),
                child: Text(imageDesc!),
              )
          ],
        ));
  }
}
