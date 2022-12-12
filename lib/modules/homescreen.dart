import 'package:dalilsyaha/components/components.dart';
import 'package:dalilsyaha/models/trip_type.dart';
import 'package:dalilsyaha/shared/local/traveldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoriesData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 7 / 9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return card(index: index, context: context);
          }),
    );
  }
}
