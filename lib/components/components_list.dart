import 'package:flutter/material.dart';

import '../configs/config_components.dart';
import '../configs/config_app.dart';

class ComponentsList extends StatelessWidget {
  final String? name;
  final String? photo;
  final String? text;
  final Function()? onTap;
  const ComponentsList({
    super.key,
    this.name,
    this.text,
    this.onTap,
    this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultSize * 1),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: colorAccent,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          margin: const EdgeInsets.only(
            bottom: defaultSize * 0.75,
          ),
          padding: const EdgeInsets.symmetric(horizontal: defaultSize),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: colorBackground,
                  borderRadius: BorderRadius.circular(defaultRadius),
                  boxShadow: [defaultShadow],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Image.network(
                    photo ?? imagePhotoBoy,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: defaultSize * 1.25),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConfigText(
                      configFontText: name ?? "No data available",
                      configFontWeight: FontWeight.bold,
                      configFontSize: defaultSize * 0.95,
                    ),
                    const SizedBox(height: defaultSize * 0.25),
                    ConfigText(configFontText: text ?? "No data available"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
