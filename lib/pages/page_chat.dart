import 'package:flutter/material.dart';

import '../components/components_list_user.dart';
import '../components/components_button.dart';
import '../configs/config_components.dart';

class PageChat extends StatelessWidget {
  const PageChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultSize,
                vertical: defaultSize,
              ),
              child: ComponentsButton(
                text: "Halaman Chat",
                color: colorBackground,
              ),
            ),
            ComponentsListUser(),
          ],
        ),
      ),
    );
  }
}
