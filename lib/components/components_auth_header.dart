import 'package:flutter/material.dart';

import '../configs/config_components.dart';
import '../configs/config_app.dart';

class ComponentsAuthHeader extends StatelessWidget {
  final String textTitle;
  final String textPage;

  const ComponentsAuthHeader({
    super.key,
    required this.textTitle,
    required this.textPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultSize * 1.5,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultSize * 5),
            ConfigText(
              configFontText: textTitle,
              configFontSize: defaultSize * 1.2,
              configFontWeight: FontWeight.w600,
            ),
            ConfigText(
              configFontText: textPage,
              configFontSize: defaultSize * 3,
              configFontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
