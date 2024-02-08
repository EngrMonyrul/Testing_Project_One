import 'dart:convert';
import 'package:flutter/cupertino.dart';

SliderItems sliderItemsFromJson(String str) =>
    SliderItems.fromJson(json.decode(str));

String sliderItemsToJson(SliderItems data) => json.encode(data.toJson());

class SliderItems {
  String? image;
  String? title;
  String? subtitle;
  Widget? response;

  SliderItems({
    this.image,
    this.title,
    this.subtitle,
    this.response,
  });

  SliderItems copyWith({
    String? image,
    String? title,
    String? subtitle,
    Widget? response,
  }) =>
      SliderItems(
        image: image ?? this.image,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        response: response ?? this.response,
      );

  factory SliderItems.fromJson(Map<String, dynamic> json) => SliderItems(
        image: json["image"],
        title: json["title"],
        subtitle: json["subtitle"],
        response: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "subtitle": subtitle,
        "response": response,
      };
}
