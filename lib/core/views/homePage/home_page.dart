import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingprojectone/common/constants/constants.dart';
import 'package:testingprojectone/common/widgets/app_bar.dart';
import 'package:testingprojectone/core/providers/home_page_services.dart';
import 'package:testingprojectone/utils/getStorage/get_storage_handler.dart';
import 'package:testingprojectone/utils/notifications/notification_handler.dart';

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenSize.height * .1,
                        width: screenSize.width,
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
                                  trailing: const Icon(CupertinoIcons
                                      .arrow_up_right_diamond_fill),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: screenSize.height * .01,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sliderItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                property.setSelectedSlider(value: index);
                                carouselControllerHandle();
                              },
                              child: Container(
                                height: 10,
                                width:
                                    index == property.selectedSlider ? 20 : 10,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
