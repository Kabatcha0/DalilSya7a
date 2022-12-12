import 'dart:ffi';

import 'package:dalilsyaha/layout/bottom_navigation_bar.dart';
import 'package:dalilsyaha/models/trip_type.dart';
import 'package:dalilsyaha/modules/details.dart';
import 'package:dalilsyaha/modules/filters.dart';
import 'package:dalilsyaha/modules/homescreen.dart';
import 'package:dalilsyaha/modules/tripdetails.dart';
import 'package:dalilsyaha/shared/local/traveldata.dart';
import 'package:flutter/material.dart';

Widget card({
  required int index,
  required BuildContext context,
}) {
  return Builder(builder: (context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      titleOfAppBar: categoriesData[index].title,
                      index: index,
                    )));
      },
      borderRadius: BorderRadius.circular(10),
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).backgroundColor.withOpacity(0.4),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                categoriesData[index].imageUrl,
                fit: BoxFit.cover,
                height: double.infinity,
              )),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.5)),
            child: Text(
              categoriesData[index].title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  });
}

Widget cardOfDetails(
    {required String imageUrl,
    required String title,
    required String season,
    required String trip,
    required int duration,
    required BuildContext context,
    required String id,
    Function()? remover}) {
  return InkWell(
    onTap: () {
      Navigator.push(context,
              MaterialPageRoute(builder: (context) => TripDetails(id: id)))
          .then((value) {
        print(value);

        if (value != null) {
          remover!();
        }
      });
    },
    child: Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.network(
                        imageUrl,
                        height: 260,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8)
                        ],
                            stops: const [
                          0.65,
                          1
                        ])),
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        title,
                        overflow: TextOverflow.fade,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.timelapse,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          duration <= 10 ? "$duration ايام" : "$duration يوم",
                          overflow: TextOverflow.fade,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.sunny,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          season,
                          overflow: TextOverflow.fade,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.title_sharp,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          trip,
                          overflow: TextOverflow.fade,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget cardSelectTrip({
  required String imageUrl,
  required List activity,
  required int lengthofActivity,
  required int lengthofProgram,
  required List program,
}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.network(imageUrl),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text(
            "الأنشطة",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(9)),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        activity[index],
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                itemCount: lengthofActivity),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text(
            "البرنامج اليومى",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(9)),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                      title: Text(program[index],
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      trailing: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.deepOrange,
                        child: Text("${index + 1} يوم",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                itemCount: lengthofProgram),
          ),
        ),
      ],
    ),
  );
}

Widget drawer({required BuildContext context}) {
  return Drawer(
    width: double.infinity,
    child: SafeArea(
      child: Column(
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            width: double.infinity,
            color: const Color.fromARGB(255, 8, 91, 158),
            child: const Text(
              "دليلك السياحى",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          listTile(
              text: 'الرحلات',
              iconData: Icons.subtitles,
              function: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Layout()));
              }),
          const SizedBox(
            height: 4,
          ),
          listTile(
              text: 'الفلترة',
              iconData: Icons.filter_list,
              function: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Filter()));
              }),
        ],
      ),
    ),
  );
}

Widget listTile({
  required String text,
  required IconData iconData,
  required Function() function,
}) {
  return ListTile(
    leading: Icon(
      iconData,
      size: 28,
      color: const Color.fromARGB(255, 8, 91, 158),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        Text(
          text,
          style: const TextStyle(
              color: Color.fromARGB(255, 8, 91, 158),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
    onTap: function,
  );
}
