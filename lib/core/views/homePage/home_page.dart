import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingprojectone/common/constants/constants.dart';
import 'package:testingprojectone/common/widgets/app_bar.dart';
import 'package:testingprojectone/core/providers/home_page_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController carouselController = CarouselController();

  void carouselControllerHandle() {
    final homePageServices =
        Provider.of<HomePageServices>(context, listen: false);
    carouselController.animateToPage(homePageServices.selectedSlider);
  }

  void onSliderChange({required int index}) {
    final homePageServices =
        Provider.of<HomePageServices>(context, listen: false);
    homePageServices.setSelectedSlider(value: index);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/photos/img_bg.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        appBar: const CustomAppbar(
          showBackButton: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Flutter Testing Project',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text('Firebase Notification',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
        ),
        body: Consumer<HomePageServices>(
          builder: (context, property, child) {
            return ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenSize.height * .1,
                      width: screenSize.width,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CarouselSlider.builder(
                        carouselController: carouselController,
                        itemCount: sliderItems.length,
                        options: CarouselOptions(
                          animateToClosest: true,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.vertical,
                          initialPage: property.selectedSlider,
                          onPageChanged: (index, reason) =>
                              onSliderChange(index: index),
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          sliderItems[index].response!));
                            },
                            child: Container(
                              height: screenSize.height * .1,
                              width: screenSize.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(sliderItems[index].image!),
                                ),
                                title: Text(
                                  sliderItems[index].title!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  sliderItems[index].subtitle!,
                                  style: const TextStyle(fontSize: 13),
                                ),
                                trailing: const Icon(
                                    CupertinoIcons.arrow_up_right_diamond_fill),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sliderItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            // onHorizontalDragEnd: (details) {
                            //   final value = property.selectedSlider + 1;
                            //   if (value < sliderItems.length) {
                            //     property.setSelectedSlider(value: value);
                            //   } else {
                            //     property.setSelectedSlider(value: 0);
                            //   }
                            //   carouselControllerHandle();
                            // },
                            // onVerticalDragEnd: (details) {
                            //   final value = property.selectedSlider - 1;
                            //   if (value > 0) {
                            //     property.setSelectedSlider(value: value);
                            //   } else {
                            //     property.setSelectedSlider(
                            //         value: sliderItems.length - 1);
                            //   }
                            //   carouselControllerHandle();
                            // },
                            onTap: () {
                              property.setSelectedSlider(value: index);
                              carouselControllerHandle();
                            },
                            child: Container(
                              height: 10,
                              width: index == property.selectedSlider ? 20 : 10,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: screenSize.height * .1),
                    Expanded(
                      child: Container(
                        width: screenSize.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: const SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Flutter Testing App',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
