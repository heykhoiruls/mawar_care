import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../configs/config_components.dart';
import '../configs/config_app.dart';

class ComponentsHomeHeader extends StatelessWidget {
  const ComponentsHomeHeader({super.key});

  greeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour < 10) {
      return "Hallo, Selamat pagi";
    } else if (hour < 14) {
      return "Hallo, Selamat siang";
    } else if (hour < 18) {
      return "Hallo, Selamat sore";
    } else {
      return "Hallo, Selamat malam";
    }
  }

  Widget buildHomeHeader(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultSize * 2,
        vertical: defaultSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConfigText(configFontText: greeting()),
              ConfigText(
                configFontText: data['name'] ?? '',
                configFontSize: defaultSize,
                configFontWeight: FontWeight.bold,
              ),
            ],
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: colorBlack,
            backgroundImage: NetworkImage(data['photo'] ?? imagePhotoBoy),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: controllerUser.streamUsers.doc(currentUserId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildHomeHeader({});
        }
        var data = snapshot.data!.data() as Map<String, dynamic>;
        return buildHomeHeader(data);
      },
    );
  }
}
