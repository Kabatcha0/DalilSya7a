import 'package:dalilsyaha/cubit/cubit.dart';
import 'package:dalilsyaha/cubit/states.dart';
import 'package:dalilsyaha/modules/splash.dart';
import 'package:dalilsyaha/shared/blocobserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DalilCubit(),
      child: BlocConsumer<DalilCubit, DalilStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(color: Color.fromARGB(255, 8, 91, 158)),
              scaffoldBackgroundColor: const Color.fromARGB(255, 8, 91, 158),
              primarySwatch: Colors.blue,
            ),
            title: 'Travel App',
          );
        },
      ),
    );
  }
}
