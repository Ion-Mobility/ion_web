import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider();

  final _isScrolling = ValueNotifier(false);

  bool get isScrolling => _isScrolling.value;

  void setScrolling(bool value) {
    _isScrolling.value = value;
  }
}

final homeProvider = ChangeNotifierProvider<HomeProvider>(
  (ref) {
    return HomeProvider();
  },
);
