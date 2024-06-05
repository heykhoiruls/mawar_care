// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/components_history_immunization.dart';
import '../../components/components_transition.dart';
import '../../components/components_floating.dart';
import '../../components/components_growth.dart';
import '../../components/components_header.dart';
import '../../components/components_choice.dart';
import '../../components/components_list.dart';
import '../../configs/config_components.dart';
import 'page_kids_detail.dart';

class PageKids extends StatefulWidget {
  final String id;
  const PageKids({
    super.key,
    required this.id,
  });

  @override
  State<PageKids> createState() => _PageKidsState();
}

class _PageKidsState extends State<PageKids> {
  bool isClicked = false;
  String? role;

  @override
  void initState() {
    super.initState();
    userRole();
  }

  Future<void> userRole() async {
    try {
      final currentUserId = FirebaseAuth.instance.currentUser!.uid;

      final user = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .get();

      final data = user.data() as Map<String, dynamic>;

      setState(() {
        role = data['role'];
      });
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controllerKid.streamKids.doc(widget.id).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.data() == null) {
          return const Scaffold(
            backgroundColor: colorBackground,
            body: SizedBox.shrink(),
          );
        }
        if (snapshot.hasData) {
          var data = snapshot.data!.data() as Map<String, dynamic>;

          int calAgeInMonths(DateTime birthDate) {
            final currentDate = DateTime.now();
            final age = currentDate.difference(birthDate);
            final ageInMonths = age.inDays ~/ 30;
            return ageInMonths;
          }

          DateTime birthDate = data['birthDate'].toDate();
          int ageInMonths = calAgeInMonths(birthDate);

          return Scaffold(
            backgroundColor: colorBackground,
            floatingActionButton: Stack(
              children: [
                (role != null && role != 'Orang Tua')
                    ? Positioned(
                        bottom: defaultSize * 0.05,
                        right: defaultSize * 0.75,
                        child: ComponentsFloating(
                          id: widget.id,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  ComponentsHeader(
                    text: "Data anak",
                    id: widget.id,
                    isKidPage: true,
                  ),
                  const SizedBox(height: defaultSize * 0.5),
                  ComponentsList(
                    photo: data['photo'],
                    name: data['name'],
                    text: "${data['gender']}, $ageInMonths Bulan",
                    onTap: () {
                      Navigator.push(
                        context,
                        transitionRight(PageKidsDetail(id: widget.id)),
                      );
                    },
                  ),
                  const SizedBox(height: defaultSize * 0.5),
                  ComponentsChoice(
                    textLeft: "Pertumbuhan",
                    textRight: "Imunisasi",
                    onValueChanged: (value) {
                      setState(() {
                        isClicked = value;
                      });
                    },
                  ),
                  const SizedBox(height: defaultSize * 1.5),
                  isClicked
                      ? ComponentsHistoryImmunization(id: data['uid'])
                      : ComponentsHistoryGrowth(id: widget.id),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
