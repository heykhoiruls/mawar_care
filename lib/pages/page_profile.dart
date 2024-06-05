import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/components_data_user.dart';
import '../components/components_button.dart';
import '../configs/config_components.dart';

class PageProfile extends StatelessWidget {
  const PageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultSize,
                vertical: defaultSize,
              ),
              child: ComponentsButton(
                text: "Halaman Profile",
                color: colorBar,
              ),
            ),
            ComponentsDataUser(
              id: currentUserId,
            ),
          ],
        ),
      ),
    );
  }
}
