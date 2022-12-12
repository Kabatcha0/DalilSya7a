import 'package:dalilsyaha/components/components.dart';
import 'package:dalilsyaha/cubit/cubit.dart';
import 'package:dalilsyaha/cubit/states.dart';
import 'package:dalilsyaha/models/trip_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DalilCubit, DalilStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DalilCubit.get(context);
        print(cubit.favoritesItem);

        if (cubit.favoritesItem.isEmpty) {
          return const Center(
            child: Text(
              "The Favorite Is Empty",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          );
        } else {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Builder(builder: (context) {
                  String seasonToString() {
                    if (cubit.favoritesItem[index].season == Season.Winter) {
                      return "الشتاء";
                    } else if (cubit.favoritesItem[index].season ==
                        Season.Summer) {
                      return "الصيف";
                    } else if (cubit.favoritesItem[index].season ==
                        Season.Autumn) {
                      return "الخريف";
                    } else if (cubit.favoritesItem[index].season ==
                        Season.Spring) {
                      return "الربيع";
                    } else {
                      return "غير معرف";
                    }
                  }

                  String tripToString() {
                    if (cubit.favoritesItem[index].tripType ==
                        TripType.Exploration) {
                      return "استكشاف";
                    } else if (cubit.favoritesItem[index].tripType ==
                        TripType.Activities) {
                      return "أنشطة";
                    } else if (cubit.favoritesItem[index].tripType ==
                        TripType.Recovery) {
                      return "النقاهة";
                    } else if (cubit.favoritesItem[index].tripType ==
                        TripType.Therapy) {
                      return "المعالجة";
                    } else {
                      return "غير معرف";
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: cardOfDetails(
                        imageUrl: cubit.favoritesItem[index].imageUrl,
                        title: cubit.favoritesItem[index].title,
                        season: seasonToString(),
                        trip: tripToString(),
                        duration: cubit.favoritesItem[index].duration,
                        context: context,
                        id: cubit.favoritesItem[index].id),
                  );
                });
              },
              itemCount: cubit.favoritesItem.length);
        }
      },
    );
  }
}
