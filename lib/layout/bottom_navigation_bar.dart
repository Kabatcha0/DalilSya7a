import 'package:dalilsyaha/components/components.dart';
import 'package:dalilsyaha/cubit/cubit.dart';
import 'package:dalilsyaha/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DalilCubit, DalilStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DalilCubit.get(context);
        return Scaffold(
          drawer: drawer(context: context),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 8, 91, 158),
            title: Text(
              cubit.appbar[cubit.currentIndex],
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 8, 91, 158),
              onTap: (v) {
                cubit.change(x: v);
              },
              currentIndex: cubit.currentIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorites"),
              ]),
        );
      },
    );
  }
}
