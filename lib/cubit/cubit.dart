import 'package:dalilsyaha/cubit/states.dart';
import 'package:dalilsyaha/models/trip_type.dart';
import 'package:dalilsyaha/modules/favorites.dart';
import 'package:dalilsyaha/modules/homescreen.dart';
import 'package:dalilsyaha/shared/local/traveldata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DalilCubit extends Cubit<DalilStates> {
  DalilCubit() : super(DalilInitialState());
  static DalilCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [const HomeScreen(), Favorite()];
  List<String> appbar = const ["دليل السياحة", "المفضلات"];

  void change({required int x}) {
    currentIndex = x;
    screens[currentIndex];
    appbar[currentIndex];
    emit(ChangeState());
  }

  bool isInSummer = false;
  bool isInWinter = false;
  bool isForFamilies = false;
  List<Trip>? trip;
  void tripData() {
    trip = null;
    trip = trips_data.where((element) {
      if (element.isInSummer != true && isInSummer == true) {
        return false;
      }
      if (element.isInWinter != true && isInWinter == true) {
        return false;
      }
      if (element.isForFamilies != true && isForFamilies == true) {
        return false;
      }

      return true;
    }).toList();
    emit(CheckState());
  }

  // void organizeDetail(int index) {
  //   trip = trips_data.where((element) {
  //     if ((isForFamilies == false ||
  //             isInSummer == true ||
  //             isInWinter == false) &&
  //         (element.isForFamilies == false ||
  //             element.isInSummer == true ||
  //             element.isInWinter == false)) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }).toList();

  //   emit(OrganizeState());
  // }

  void remover(String theId, List<Trip> trip) {
    trip.removeWhere((element) => element.id == theId);

    emit(RemoveState());
  }

  void changeStateSummer() {
    isInSummer = !isInSummer;

    emit(ChangeSummerState());
  }

  void changeStateWinter() {
    isInWinter = !isInWinter;
    emit(ChangeWinterState());
  }

  void changeStateFamilies() {
    isForFamilies = !isForFamilies;
    emit(ChangeFamiliesState());
  }

  bool isFavorite = false;
  void favorites() {
    isFavorite = !isFavorite;
    emit(FavoritesState());
  }

  List<Trip> favoritesItem = [];
  int? index;
  void addItem(String theId) {
    index = favoritesItem.indexWhere((element) => theId == element.id);
    if (index! >= 0) {
      favoritesItem.removeAt(index!);
    } else {
      favoritesItem
          .add(trips_data.firstWhere((element) => element.id == theId));
    }
    print(favoritesItem[0].isInSummer);
    emit(AddItemState());
  }
}
