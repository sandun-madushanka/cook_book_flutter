import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier {
  List list = [];

  void addShops(String val) {
    list.add(val);
    notifyListeners();
  }

  void assignList(List list) {
    list = list;
    notifyListeners();
  }
}
