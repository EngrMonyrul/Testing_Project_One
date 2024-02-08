import 'package:flutter/foundation.dart';

class HomePageServices extends ChangeNotifier {
  int _selectedSlider = 0;

  int get selectedSlider => _selectedSlider;

  void setSelectedSlider({required int value}) {
    _selectedSlider = value;
    notifyListeners();
  }
}
