import 'package:flutter/material.dart';

class BusinessProvider with ChangeNotifier {
  String _businessName = '';
  String _email = '';
   String _industryType = '';

  String get businessName => _businessName;
  String get email => _email;
    String get industryType => _industryType;

  void setBusinessName(String value) {
    _businessName = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }
   void setIndustryType(String value) {
    _industryType = value;
    notifyListeners();
  }
}

