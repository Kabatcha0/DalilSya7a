import 'package:dalilsyaha/components/components.dart';
import 'package:dalilsyaha/cubit/cubit.dart';
import 'package:dalilsyaha/cubit/states.dart';
import 'package:dalilsyaha/layout/bottom_navigation_bar.dart';
import 'package:dalilsyaha/modules/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DalilCubit, DalilStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DalilCubit.get(context);
        return Scaffold(
          drawer: drawer(context: context),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.tripData();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Layout()));
                  },
                  icon: const Icon(Icons.save)),
            ],
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "الفلترة",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                SwitchListTile.adaptive(
                    value: cubit.isInSummer,
                    onChanged: (v) {
                      cubit.changeStateSummer();
                    },
                    title: const Text(
                      "الرحلات الصيفية فقط",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: const Text(
                      "اظهار الرحلات فى فصل الصيف فقط",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SwitchListTile.adaptive(
                    value: cubit.isInWinter,
                    onChanged: (v) {
                      cubit.changeStateWinter();
                    },
                    title: const Text(
                      "الرحلات الشتوية فقط",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: const Text(
                      "اظهار الرحلات فى فصل الشتوية فقط",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SwitchListTile.adaptive(
                    value: cubit.isForFamilies,
                    onChanged: (v) {
                      cubit.changeStateFamilies();
                    },
                    title: const Text(
                      "الرحلات العائلية فقط",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: const Text(
                      "اظهار الرحلات للعوائل فقط",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
