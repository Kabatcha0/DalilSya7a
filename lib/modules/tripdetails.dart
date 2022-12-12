import 'package:dalilsyaha/components/components.dart';
import 'package:dalilsyaha/cubit/cubit.dart';
import 'package:dalilsyaha/cubit/states.dart';
import 'package:dalilsyaha/layout/bottom_navigation_bar.dart';
import 'package:dalilsyaha/shared/local/traveldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripDetails extends StatelessWidget {
  String id;
  TripDetails({required this.id});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final selectedTrip = trips_data.firstWhere((e) {
        return e.id == id;
      });
      return BlocConsumer<DalilCubit, DalilStates>(
          builder: (context, state) {
            var cubit = DalilCubit.get(context);
            bool checkFavorite(String thisId) {
              return cubit.favoritesItem.any((e) {
                return e.id == id;
              });
            }

            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        cubit.favorites();
                        cubit.addItem(id);
                      },
                      icon: checkFavorite(id)
                          ? const Icon(Icons.star)
                          : const Icon(Icons.star_border))
                ],
                title: Text(selectedTrip.title),
                centerTitle: true,
                elevation: 0,
              ),
              body: cardSelectTrip(
                imageUrl: selectedTrip.imageUrl,
                activity: selectedTrip.activities,
                lengthofActivity: selectedTrip.activities.length,
                lengthofProgram: selectedTrip.program.length,
                program: selectedTrip.program,
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop(id);
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.blue,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
            );
          },
          listener: (context, state) {});
    });
  }
}
