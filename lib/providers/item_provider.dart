import 'package:demo_with_provider/models/local_data.dart';
import 'package:flutter/material.dart';

List<Map> _cartItemPro = [];
int _countListLen = 0;

class ItemProvider extends ChangeNotifier {
  int get countListLen => _countListLen;
  List<Map> get cartItemPro => _cartItemPro;
  void AddToCart(Map) {
    _cartItemPro.add(Map);
    _countListLen++;
    notifyListeners();
  }

  void addCountInCard() {
    _countListLen++;
    notifyListeners();
  }

  void RemoveToCart(Map) {
    _cartItemPro.remove(Map);
    _countListLen--;

    notifyListeners();
  }
}
