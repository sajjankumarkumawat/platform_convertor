import 'package:flutter/foundation.dart';

class SwitchProvider with ChangeNotifier
{
  bool _isProfile = false;
  bool _isActive = false;
  bool _isTheme = false;
  DateTime? _date;

  bool get isProfile => _isProfile;
  bool get isActive => _isActive;
  bool get isTheme => _isTheme;
  DateTime? get date => _date;

  void setisProfile(){
    _isProfile = !_isProfile;
    notifyListeners();
  }

  void setisDate(){
    _date = _date;
    notifyListeners();
  }

  void setisActive(){
    _isActive = !_isActive;
    notifyListeners();
  }

  void setisTheme(){
    _isTheme = !_isTheme;
    notifyListeners();
  }
}