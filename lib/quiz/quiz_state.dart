import 'package:flutter/material.dart';
import 'package:myapp/services/models.dart';

class QuizState with ChangeNotifier {
  double _progress = 0;
  Option? _selected;

  final PageController controller = PageController();

  double get progress => _progress;
  Option? get selected => _selected;

  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  set selected(Option? newValur) {
    _selected = newValur;
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
