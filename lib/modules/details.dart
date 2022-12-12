import 'package:dalilsyaha/components/components.dart';
import 'package:dalilsyaha/cubit/cubit.dart';
import 'package:dalilsyaha/cubit/states.dart';
import 'package:dalilsyaha/models/trip_type.dart';
import 'package:dalilsyaha/shared/local/traveldata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  late String titleOfAppBar;
  late int index;
  DetailsScreen({required this.titleOfAppBar, required this.index});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Trip>? trip;
  Widget build(BuildContext context) {
    return BlocConsumer<DalilCubit, DalilStates>(
        builder: (context, state) {
          var cubit = DalilCubit.get(context);
          if ((cubit.trip == null || cubit.trip!.isEmpty) && trip == null) {
            trip = trips_data.where((element) {
              print("hello");
              return element.categories
                  .contains(categoriesData[widget.index].id);
            }).toList();
          }
          if (cubit.trip != null) {
            // cubit.organizeDetail(widget.index);
            trip = cubit.trip!;
            trip = trip!
                .where((element) => element.categories
                    .contains(categoriesData[widget.index].id))
                .toList();
          }
          void remover(String theId) {
            setState(() {
              trip!.removeWhere((element) => element.id == theId);
            });
          }

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 8, 91, 158),
              title: Text(
                widget.titleOfAppBar,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Builder(builder: (context) {
                    String seasonToString() {
                      if (trip![index].season == Season.Winter) {
                        return "الشتاء";
                      } else if (trip![index].season == Season.Summer) {
                        return "الصيف";
                      } else if (trip![index].season == Season.Autumn) {
                        return "الخريف";
                      } else if (trip![index].season == Season.Spring) {
                        return "الربيع";
                      } else {
                        return "غير معرف";
                      }
                    }

                    String tripToString() {
                      if (trip![index].tripType == TripType.Exploration) {
                        return "استكشاف";
                      } else if (trip![index].tripType == TripType.Activities) {
                        return "أنشطة";
                      } else if (trip![index].tripType == TripType.Recovery) {
                        return "النقاهة";
                      } else if (trip![index].tripType == TripType.Therapy) {
                        return "المعالجة";
                      } else {
                        return "غير معرف";
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: cardOfDetails(
                          remover: () => remover(trip![index].id),
                          imageUrl: trip![index].imageUrl,
                          title: trip![index].title,
                          season: seasonToString(),
                          trip: tripToString(),
                          duration: trip![index].duration,
                          context: context,
                          id: trip![index].id),
                    );
                  });
                },
                itemCount: trip!.length),
          );
        },
        listener: (context, state) {});
  }
}
