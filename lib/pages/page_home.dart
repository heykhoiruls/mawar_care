import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../components/components_home_header.dart';
import '../components/components_transition.dart';
import '../components/components_list_kids.dart';
import '../components/components_row.dart';
import '../configs/config_components.dart';
import '../models/model_controller.dart';
import 'page_kids/page_kids_add.dart';

class PageHome extends StatefulWidget {
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<String>? onSearchTextChanged;
  const PageHome({
    super.key,
    this.onFocusChange,
    this.onSearchTextChanged,
  });

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  String _searchText = '';
  ModelController user = ModelController();
  int selectedCategoryIndex = 0;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: SafeArea(
        child: Column(
          children: [
            const ComponentsHomeHeader(),
            ComponentsRow(
              textHint: "Cari nama anak . . .",
              icon: const LineIcon.plus(color: colorBlack),
              onFocusChange: (hasFocus) {
                setState(() {
                  _isFocused = hasFocus;
                });
                widget.onFocusChange?.call(_isFocused);
              },
              onTap: () {
                Navigator.push(
                  context,
                  transitionRight(const PageKidsAdd()),
                );
              },
              onSearchTextChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
              isChat: false,
            ),
            const SizedBox(height: defaultSize),
            ComponentsListKids(
              searchText: _searchText,
            ),
          ],
        ),
      ),
    );
  }
}
