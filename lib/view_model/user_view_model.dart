
import 'package:flutter/cupertino.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
  Future<bool> saveUser(UserModel user) async{

    //shared preferences initialized in this way via creating its instance:
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    // changes in future or whereever saveUser function called, notified:
    notifyListeners();

    return true;
  }

  Future<UserModel> getUser() async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    // 'token' (key inside getString)  has to be same as mentioned in shared preferences while setting (set in saveUser):
    final String? token = sp.getString('token');
    return UserModel(
      // 'on the basis of parameter': variable in which setString is getting:
      token: token.toString()
    );
  }

  Future<bool> remove()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    // Below: everything cleared out of shared preferences
    return true;
  }
}